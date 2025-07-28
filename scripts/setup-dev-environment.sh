#!/bin/bash

# ================================================
# ShadowCom - Development Environment Setup
# ================================================

set -e  # Exit on any error

echo "🕊️  ShadowCom Development Environment Setup"
echo "=============================================="
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
        echo "windows"
    else
        echo "unknown"
    fi
}

OS=$(detect_os)
log_info "Detected OS: $OS"

# ================================================
# Prerequisites Check
# ================================================

check_prerequisites() {
    log_info "Checking prerequisites..."
    
    # Git
    if ! command_exists git; then
        log_error "Git is not installed. Please install Git first."
        exit 1
    fi
    log_success "Git is installed"
    
    # Check for package managers
    if [[ "$OS" == "macos" ]]; then
        if ! command_exists brew; then
            log_warning "Homebrew not found. Installing..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
    elif [[ "$OS" == "linux" ]]; then
        if command_exists apt; then
            PACKAGE_MANAGER="apt"
        elif command_exists yum; then
            PACKAGE_MANAGER="yum"
        elif command_exists pacman; then
            PACKAGE_MANAGER="pacman"
        else
            log_error "No supported package manager found (apt, yum, pacman)"
            exit 1
        fi
    fi
}

# ================================================
# Node.js Installation
# ================================================

install_nodejs() {
    log_info "Setting up Node.js..."
    
    if command_exists node; then
        NODE_VERSION=$(node --version)
        log_info "Node.js already installed: $NODE_VERSION"
        
        # Check if version is >= 18
        NODE_MAJOR=$(echo $NODE_VERSION | cut -d'.' -f1 | sed 's/v//')
        if [ "$NODE_MAJOR" -lt 18 ]; then
            log_warning "Node.js version $NODE_VERSION is too old. Need >= 18.x"
            INSTALL_NODE=true
        else
            log_success "Node.js version is compatible"
            INSTALL_NODE=false
        fi
    else
        INSTALL_NODE=true
    fi
    
    if [ "$INSTALL_NODE" = true ]; then
        if [[ "$OS" == "macos" ]]; then
            brew install node@18
        elif [[ "$OS" == "linux" ]]; then
            # Install via NodeSource repository
            curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
            sudo apt-get install -y nodejs
        else
            log_error "Please install Node.js 18+ manually from https://nodejs.org"
            exit 1
        fi
        log_success "Node.js installed"
    fi
    
    # Install global packages
    log_info "Installing global npm packages..."
    npm install -g @react-native-community/cli
    npm install -g yarn
    log_success "Global packages installed"
}

# ================================================
# React Native Setup
# ================================================

setup_react_native() {
    log_info "Setting up React Native development environment..."
    
    if [[ "$OS" == "macos" ]]; then
        # Install Xcode Command Line Tools
        if ! xcode-select -p >/dev/null 2>&1; then
            log_info "Installing Xcode Command Line Tools..."
            xcode-select --install
        fi
        
        # Install iOS dependencies
        brew install cocoapods
        log_success "iOS development tools installed"
        
    elif [[ "$OS" == "linux" ]]; then
        log_warning "iOS development not available on Linux"
    fi
    
    # Android Setup
    log_info "Setting up Android development..."
    
    if [[ "$OS" == "macos" ]]; then
        brew install --cask android-studio
    elif [[ "$OS" == "linux" ]]; then
        if [ "$PACKAGE_MANAGER" = "apt" ]; then
            sudo apt update
            sudo apt install -y openjdk-11-jdk android-sdk
        fi
    fi
    
    log_warning "Please install Android Studio and configure Android SDK manually"
    log_warning "Add these to your shell profile (.bashrc, .zshrc):"
    echo
    echo "export ANDROID_HOME=\$HOME/Android/Sdk"
    echo "export PATH=\$PATH:\$ANDROID_HOME/emulator"
    echo "export PATH=\$PATH:\$ANDROID_HOME/tools"
    echo "export PATH=\$PATH:\$ANDROID_HOME/tools/bin"
    echo "export PATH=\$PATH:\$ANDROID_HOME/platform-tools"
    echo
}

# ================================================
# Docker Setup
# ================================================

install_docker() {
    log_info "Setting up Docker..."
    
    if command_exists docker; then
        log_success "Docker already installed"
    else
        if [[ "$OS" == "macos" ]]; then
            brew install --cask docker
        elif [[ "$OS" == "linux" ]]; then
            # Install Docker
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo usermod -aG docker $USER
            rm get-docker.sh
        fi
        log_success "Docker installed"
    fi
    
    # Install Docker Compose
    if ! command_exists docker-compose; then
        log_info "Installing Docker Compose..."
        if [[ "$OS" == "macos" ]]; then
            brew install docker-compose
        elif [[ "$OS" == "linux" ]]; then
            sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
        fi
        log_success "Docker Compose installed"
    fi
}

# ================================================
# Development Tools
# ================================================

install_dev_tools() {
    log_info "Installing development tools..."
    
    # Wireshark for network analysis
    if [[ "$OS" == "macos" ]]; then
        brew install --cask wireshark
    elif [[ "$OS" == "linux" ]]; then
        if [ "$PACKAGE_MANAGER" = "apt" ]; then
            sudo apt install -y wireshark
        fi
    fi
    
    # curl and wget
    if [[ "$OS" == "macos" ]]; then
        brew install curl wget
    elif [[ "$OS" == "linux" ]]; then
        if [ "$PACKAGE_MANAGER" = "apt" ]; then
            sudo apt install -y curl wget
        fi
    fi
    
    log_success "Development tools installed"
}

# ================================================
# Project Setup
# ================================================

setup_project() {
    log_info "Setting up project structure..."
    
    # Create directories
    mkdir -p mobile-app
    mkdir -p signaling-server
    mkdir -p stun-turn-server
    mkdir -p vpn-server
    mkdir -p tests
    
    # Initialize package.json files
    if [ ! -f "package.json" ]; then
        npm init -y
        log_success "Root package.json created"
    fi
    
    log_success "Project structure created"
}

# ================================================
# Configuration Files
# ================================================

create_config_files() {
    log_info "Creating configuration files..."
    
    # Create example environment file
    if [ ! -f ".env.example" ]; then
        cat > .env.example << EOF
# ShadowCom Configuration Example

# Signaling Server
SIGNALING_SERVER_PORT=3000
SIGNALING_SERVER_HOST=localhost

# STUN/TURN Server
TURN_SERVER_HOST=stun.shadowcom.local
TURN_SECRET=your-turn-secret-here

# VPN Configuration
VPN_SERVER_HOST=vpn.shadowcom.local
WIREGUARD_PRIVATE_KEY=your-private-key-here

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/shadowcom

# Development
NODE_ENV=development
DEBUG=shadowcom:*
EOF
        log_success ".env.example created"
    fi
    
    # Create Docker Compose for development
    if [ ! -f "docker-compose.dev.yml" ]; then
        cat > docker-compose.dev.yml << EOF
version: '3.8'

services:
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: shadowcom
      POSTGRES_USER: dev
      POSTGRES_PASSWORD: devpass
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  coturn:
    image: coturn/coturn:latest
    ports:
      - "3478:3478"
      - "3478:3478/udp"
      - "5349:5349"
      - "65000-65535:65000-65535/udp"
    volumes:
      - ./stun-turn-server/turnserver.conf:/etc/coturn/turnserver.conf

volumes:
  redis_data:
  postgres_data:
EOF
        log_success "Docker Compose configuration created"
    fi
}

# ================================================
# Main Installation
# ================================================

main() {
    echo "Starting ShadowCom development environment setup..."
    echo
    
    check_prerequisites
    install_nodejs
    setup_react_native
    install_docker
    install_dev_tools
    setup_project
    create_config_files
    
    echo
    log_success "✅ Development environment setup complete!"
    echo
    echo "Next steps:"
    echo "1. Restart your terminal or run: source ~/.bashrc (or ~/.zshrc)"
    echo "2. Configure Android SDK in Android Studio"
    echo "3. Copy .env.example to .env and configure"
    echo "4. Run: docker-compose -f docker-compose.dev.yml up -d"
    echo "5. Check progress with: cat progress/CHECKLIST.md"
    echo
    echo "Happy coding! 🚀"
}

# Run main function
main "$@" 