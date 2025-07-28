# 🕊️ ShadowCom - Sistema de Comunicação Criptografada

> Sistema de Comunicação Criptografada via VoIP sobre LTE com E2EE e Camuflagem de Tráfego

## 🎯 Objetivo

Sistema de comunicação segura (voz + mensagens) que:
- ✅ Não depende da infraestrutura de voz da operadora (somente dados)
- ✅ Totalmente criptografado ponta a ponta (E2EE)
- ✅ Camufla o tráfego para parecer normal (HTTPS)
- ✅ Funciona com rede móvel (LTE/5G) ou Wi-Fi
- ✅ Autenticação anônima e robusta
- ✅ Leitura condicional de mensagens com verificação facial contínua

## 📋 Status Geral do Projeto

### 🚀 Roadmap & Progresso

| Fase | Status | Descrição | Progresso |
|------|--------|-----------|-----------|
| **MVP** | 🔄 **EM ANDAMENTO** | Chamadas VoIP seguras via VPN + App com IDs | 0% |
| **Fase 2** | ⏳ Pendente | Mensagens seguras + interface stealth | 0% |
| **Fase 3** | ⏳ Pendente | Visualização com verificação facial contínua | 0% |
| **Fase 4** | ⏳ Pendente | Integração com eSIM/rotina de troca de identidade | 0% |
| **Fase 5** | ⏳ Pendente | Camadas de redundância e relay dinâmico global | 0% |

---

## 🗂️ Estrutura do Projeto

```
ShadowCom/
├── 📱 mobile-app/          # App React Native
├── 🔧 signaling-server/    # Servidor de sinalização
├── 🌐 stun-turn-server/    # Servidor STUN/TURN
├── 🔒 vpn-server/          # Configurações VPN
├── 📚 docs/               # Documentação técnica
├── 🧪 tests/              # Testes e validação
└── 📊 progress/           # Acompanhamento detalhado
```

## 🔗 Links Rápidos

- [📊 Checklist Detalhado](./progress/CHECKLIST.md)
- [🏗️ Arquitetura Técnica](./docs/ARCHITECTURE.md)
- [🔐 Especificações de Segurança](./docs/SECURITY.md)
- [📱 Setup do App Mobile](./mobile-app/README.md)

---

## 🚀 Início Rápido

1. **Clone e setup inicial:**
   ```bash
   git clone <repo>
   cd ShadowCom
   ```

2. **Verifique o progresso atual:**
   ```bash
   cat progress/CHECKLIST.md
   ```

3. **Inicie o desenvolvimento:**
   - Ver checklist da fase atual em `progress/CHECKLIST.md`
   - Seguir documentação técnica em `docs/`

---

## 📞 Contato & Contribuição

- 🔒 **Segurança:** Reporte vulnerabilidades via canal seguro
- 📋 **Issues:** Use o sistema de checklist para tracking
- 🤝 **Contribuição:** Seguir guidelines de segurança

---

*⚠️ Este é um projeto de comunicação segura. Todas as implementações devem seguir as melhores práticas de segurança e criptografia.* 