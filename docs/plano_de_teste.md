# Plano de Testes — Sistema de Cinema (CineTicket API)

## 1. Objetivo
Este plano de testes tem como objetivo validar a qualidade da API do sistema de cinema (CineTicket), garantindo que as funcionalidades principais operem corretamente e que o sistema seja capaz de suportar múltiplos usuários simultaneamente.

Os testes visam identificar defeitos, validar os requisitos funcionais definidos nas histórias de usuário e avaliar o comportamento do sistema em diferentes cenários.

---

## 2. Escopo do Teste
Serão testadas as principais funcionalidades da plataforma relacionadas ao fluxo de compra de ingressos.

### Funcionalidades incluídas:
- Registro de usuário  
- Login e autenticação  
- Navegação de filmes  
- Visualização de detalhes do filme  
- Visualização de sessões  
- Seleção de assentos  
- Processo de checkout  
- Visualização de reservas  

Essas funcionalidades são baseadas nas User Stories definidas no projeto.

---

## 3. Tipos de Testes Realizados

Para garantir uma validação completa do sistema, foram aplicados diferentes tipos de testes:

### Testes Funcionais
Validação das funcionalidades principais do sistema com base nas histórias de usuário.

**Exemplos:**
- Registro de usuário  
- Login  
- Criação de filmes  
- Seleção de assentos  
- Finalização de compra  

---

### Testes de API
Validação da API responsável pelas funcionalidades do sistema.

**Rotas testadas:**
- Autenticação  
- Filmes  
- Sessões  
- Reservas  

**Objetivos:**
- Verificar respostas corretas da API  
- Validar códigos de status HTTP  
- Validar estrutura dos dados retornados  

---

### Testes Automatizados
Cenários críticos do sistema foram automatizados para garantir repetibilidade e eficiência.

**Cenários automatizados:**
- Consulta de filmes  
- Busca por ID  
- Autenticação (login e geração de token)  
- Criação de reservas  

---

### Testes de Performance
Foram realizados testes de carga para avaliar o comportamento do sistema sob múltiplos acessos simultâneos.

**Ferramenta utilizada:** Apache JMeter  

**Cenário testado:**
- Múltiplos usuários acessando a listagem de filmes  

**Métricas analisadas:**
- Tempo de resposta  
- Throughput  
- Taxa de erro  

---

## 4. Estratégia de Teste
A estratégia adotada foi baseada na validação das histórias de usuário.

O processo de teste seguiu as seguintes etapas:
- Análise das histórias de usuário  
- Criação dos casos de teste  
- Execução manual dos testes  
- Registro de defeitos encontrados  
- Automação de cenários críticos  
- Execução de testes de API  
- Execução de testes de performance  

---

## 5. Ambiente de Teste

Os testes foram executados em ambiente local com os seguintes componentes:

### Backend:
- Node.js  
- API CineTicket  

### Ferramentas utilizadas:
- Postman (testes manuais e automatizados)  
- Apache JMeter  
- JavaScript  
- XMind (mapa mental)  
- GitHub (versionamento)  
- OneNote (documentação)  

---

## 6. Critérios de Sucesso

Os testes são considerados bem-sucedidos quando:
- As funcionalidades atendem aos critérios de aceitação das histórias de usuário  
- A API retorna respostas corretas  
- Não existem erros críticos que impeçam o fluxo de reserva  
- O sistema responde adequadamente durante os testes de carga  

---

## 7. Riscos e Limitações

Algumas limitações podem impactar os testes:
- O ambiente local pode não refletir exatamente o ambiente de produção  
- Testes de pagamento utilizam simulação  
- Tempo limitado para execução completa de todos os cenários possíveis  