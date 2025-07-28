# 🎯 Fase Atual: MVP - Setup e Infraestrutura Base

**Data de Início:** [Data Atual]  
**Prazo Estimado:** 4-6 semanas  
**Progresso Atual:** 0%

---

## 📋 Objetivos da Fase MVP

### Meta Principal
Ter um sistema funcional de chamadas VoIP criptografadas que:
- ✅ Estabeleça conexões seguras via VPN camuflada
- ✅ Realize chamadas de voz com qualidade aceitável
- ✅ Implemente criptografia E2E básica
- ✅ Funcione em dispositivos Android/iOS

### Critérios de Sucesso
- [ ] Duas pessoas conseguem fazer uma chamada segura
- [ ] Tráfego é camuflado como HTTPS
- [ ] Qualidade de áudio é aceitável (< 200ms latência)
- [ ] App funciona em dispositivos reais (não só emulador)
- [ ] Sistema passa em testes básicos de segurança

---

## 🗓️ Cronograma Semanal

### **Semana 1: Setup e Planejamento** (ATUAL)
**Foco:** Estrutura do projeto e documentação

#### Tarefas Prioritárias (Esta Semana)
- [x] ✅ Criar estrutura de pastas e documentação
- [x] ✅ Configurar sistema de checklist
- [ ] 🔄 Setup do repositório Git
- [ ] 🔄 Configurar ambiente de desenvolvimento
- [ ] 🔄 Escolher e configurar stack tecnológico

#### Entregáveis da Semana
- [ ] Repositório Git configurado
- [ ] Ambiente de dev preparado (Node.js, React Native, Docker)
- [ ] Documentação técnica completa
- [ ] Primeiro protótipo da VPN funcionando

---

### **Semana 2: Infraestrutura VPN**
**Foco:** WireGuard + Ofuscação

#### Tarefas Planejadas
- [ ] Setup WireGuard em servidor cloud
- [ ] Implementar ofuscação Obfs4
- [ ] Configurar porta 443 (camuflagem HTTPS)
- [ ] Testes básicos de conectividade
- [ ] Deploy em múltiplas regiões

#### Entregáveis da Semana
- [ ] VPN funcionando e camuflada
- [ ] Clientes conectando com sucesso
- [ ] Testes de evasão de DPI básicos

---

### **Semana 3: Servidor de Sinalização**
**Foco:** WebRTC Signaling + Criptografia

#### Tarefas Planejadas
- [ ] Implementar servidor de sinalização
- [ ] Sistema de troca de chaves
- [ ] Integração com libsodium
- [ ] Testes de handshake
- [ ] Documentação da API

#### Entregáveis da Semana
- [ ] Servidor de sinalização funcional
- [ ] Protocolo de troca de chaves implementado
- [ ] Testes unitários passando

---

### **Semana 4: STUN/TURN Server**
**Foco:** NAT Traversal

#### Tarefas Planejadas
- [ ] Setup coturn
- [ ] Configurar autenticação
- [ ] Integração com signaling server
- [ ] Testes de NAT traversal
- [ ] Monitoramento básico

#### Entregáveis da Semana
- [ ] STUN/TURN funcionando
- [ ] Conexões P2P estabelecidas
- [ ] Fallback para relay testado

---

### **Semana 5-6: App Mobile MVP**
**Foco:** Aplicativo funcional

#### Tarefas Planejadas
- [ ] Setup React Native
- [ ] Interface básica (login, contatos, chamada)
- [ ] Integração WebRTC
- [ ] Conexão com todos os serviços
- [ ] Testes em dispositivos reais

#### Entregáveis da Semana
- [ ] App instalável e funcional
- [ ] Primeira chamada E2E bem-sucedida
- [ ] Testes básicos passando
- [ ] Documentation para usuários

---

## 🚀 Próximas Ações (Esta Semana)

### Hoje
1. **Configurar repositório Git**
   - Criar repo privado
   - Setup de branches (main, develop, feature/*)
   - Configurar .gitignore apropriado

2. **Setup ambiente de desenvolvimento**
   - Instalar Node.js, npm/yarn
   - Configurar React Native CLI
   - Setup Docker para servidores
   - Configurar IDE/editor

### Amanhã  
1. **Inicializar projeto React Native**
   - `npx react-native init ShadowComApp`
   - Configurar dependências básicas
   - Testar build em Android/iOS

2. **Preparar infraestrutura cloud**
   - Escolher provedor (DigitalOcean/Hetzner)
   - Configurar primeira instância
   - Setup inicial do WireGuard

### Resto da Semana
1. **Documentação técnica detalhada**
2. **Primeiro protótipo de VPN**
3. **Planejamento detalhado da Semana 2**

---

## 🎯 Métricas de Progresso

### Checklist Rápido (Semana 1)
- [ ] 📁 Estrutura de projeto criada
- [ ] 🔧 Git configurado
- [ ] 💻 Ambiente de dev preparado  
- [ ] 📱 React Native inicializado
- [ ] ☁️ Servidor cloud configurado
- [ ] 📚 Docs técnicas completas
- [ ] 🔒 Protótipo VPN funcionando

**Progresso Semanal:** 2/7 (29%) ✅

---

## 🚨 Bloqueadores e Riscos

### Bloqueadores Atuais
- Nenhum identificado

### Riscos Identificados
1. **Complexidade do WebRTC**: Curva de aprendizado alta
   - *Mitigação*: Começar com bibliotecas prontas
   
2. **Configuração VPN**: Possíveis problemas de rede
   - *Mitigação*: Testar em múltiplos provedores

3. **Performance Mobile**: Bateria e recursos
   - *Mitigação*: Profiling desde o início

### Próxima Revisão
**Data:** Final da Semana 1  
**Foco:** Avaliar progresso do setup e ajustar cronograma se necessário

---

## 📞 Contatos e Recursos

### Links Úteis
- [React Native WebRTC Docs](https://github.com/react-native-webrtc/react-native-webrtc)
- [WireGuard Documentation](https://www.wireguard.com/quickstart/)
- [coturn Setup Guide](https://github.com/coturn/coturn)
- [libsodium Documentation](https://doc.libsodium.org/)

### Comandos Rápidos
```bash
# Verificar progresso
cat progress/CHECKLIST.md | grep -E "\[x\]|\[ \]" | head -20

# Setup rápido do ambiente
./scripts/setup-dev-environment.sh

# Status do projeto
git status && docker ps && npm run test
```

---

*Última atualização: [Data/Hora atual]*  
*Próxima atualização: [Data da próxima revisão]* 