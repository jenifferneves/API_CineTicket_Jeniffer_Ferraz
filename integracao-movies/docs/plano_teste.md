# Plano de Teste - Sistema de Cinema (CineTicket)

---

## 1. Objetivo

Este plano de teste tem como objetivo validar a qualidade do sistema de cinema (CineTicket), contemplando backend, frontend e a integração entre ambos, garantindo que as funcionalidades implementadas operem corretamente.

### Os testes visam:
- Identificar defeitos
- Validar os requisitos funcionais definidos nas histórias de usuário
- Garantir a consistência dos dados entre API e interface
- Avaliar o comportamento do sistema em diferentes cenários

---

## 2. Escopo do Teste

Serão testadas as funcionalidades relacionadas à feature de filmes, com foco na integração entre backend e frontend.

### Funcionalidades incluídas:
- Navegação de filmes
- Visualização de detalhes do filme
- Consumo da API `/movies`
- Exibição dos dados no frontend
- Tratamento de erros da API

### Fluxo validado:
Simulação do comportamento do usuário ao acessar a listagem de filmes e visualizar seus detalhes, validando a comunicação entre frontend e backend.

As funcionalidades são baseadas nas User Stories definidas no projeto Cinema App.

---

## 3. Tipos de Testes Realizados

Para garantir uma validação completa da funcionalidade, foram aplicados diferentes tipos de testes.

### Testes Funcionais
Validação das funcionalidades com base nas histórias de usuário.

**Exemplos:**
- Listagem de filmes
- Visualização de detalhes
- Navegação entre telas

---

### Testes de API

Validação da API responsável pelas funcionalidades de filmes.

**Rota testada:**
- `/movies`

**Objetivos:**
- Verificar respostas corretas da API
- Validar códigos de status HTTP
- Validar estrutura dos dados retornados
- Validar regras de negócio (ex: duração válida)

---

### Testes de Frontend

Validação da interface do usuário.

**Cenários:**
- Exibição de filmes em formato de grid
- Renderização de informações (título, duração, gênero, etc.)
- Exibição de imagens (poster e fallback)
- Responsividade em diferentes tamanhos de tela
- Tratamento de erro da API

---

### Testes de Integração

Validação da comunicação entre frontend e backend.

**Cenários:**
- Consumo da API `/movies` pelo frontend
- Consistência de dados entre API e interface
- Navegação para detalhes do filme via ID
- Tratamento de falhas da API
- Exibição de lista vazia

**Objetivos:**
- Garantir que o frontend consome corretamente os dados da API
- Validar o contrato entre os sistemas

---

### Testes Automatizados

Cenários críticos do sistema foram automatizados para garantir repetibilidade e eficiência.

**Cenários automatizados:**
- Consulta de filmes
- Busca por ID

---

## 4. Estratégia de Teste

A estratégia adotada foi baseada na validação das histórias de usuário e no fluxo real de utilização da funcionalidade de filmes.

### Etapas do processo:
- Análise das histórias de usuário
- Criação dos casos de teste (frontend e backend)
- Execução manual dos testes
- Execução de testes de API
- Execução de testes de integração
- Automação de cenários críticos
- Execução de testes de performance
- Registro de defeitos encontrados

---

## 5. Ambiente de Teste

Os testes foram executados utilizando ambiente local.

### Backend:
- Node.js
- API Cinema Challenge

### Frontend:
- Aplicação web (Cinema Front)

### Ferramentas:
- Postman (testes manuais)
- GitHub (versionamento)
- OneNote (documentação)

---

## 6. Critérios de Sucesso

Os testes são considerados bem-sucedidos quando:

- As funcionalidades atendem aos critérios de aceitação
- A API retorna respostas corretas
- O frontend exibe corretamente os dados da API
- Não existem erros críticos que quebrem a navegação
- A integração entre frontend e backend funciona corretamente

---

## 7. Riscos e Limitações

Algumas limitações podem impactar os testes:

- Ambiente local pode não refletir exatamente o ambiente de produção
- Testes de pagamento utilizam simulação
- Tempo limitado para execução completa de todos os cenários possíveis