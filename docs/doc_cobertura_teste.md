# Cobertura de Testes da API

A cobertura de testes da API foi analisada com base na automação implementada utilizando **Robot Framework**, contemplando cenários positivos, negativos e fluxos de integração entre serviços.

---

## Cobertura Atual

Atualmente, os testes automatizados contemplam os seguintes cenários:

### Autenticação

#### Cenários positivos:
- Registro de usuário
- Login com credenciais válidas
- Geração de token JWT

#### Cenários negativos:
- Login com senha inválida → retorno **400 ou 401**
- Login com email inválido → retorno **401**
- Registro de usuário com email duplicado → retorno **400 ou 409**
- Registro de usuário sem campos obrigatórios → retorno **400**

---

### Administração

- Criação de usuário administrador

---

### Filmes

#### Cenários positivos:
- Criação de filmes (endpoint protegido)
- Listagem de filmes
- Validação da estrutura da resposta
- Validação de dados retornados no payload

#### Cenários negativos:
- Criação de filme sem token → **401 (não autorizado)**
- Criação de filme com token inválido → **401**
- Criação de filme com token mal formatado → **401**
- Criação de filme com usuário comum → **403 (forbidden)**
- Criação de filme com campos inválidos → **400 (bad request)**

---

### Reservas (Fluxo End-to-End + Cenários Negativos)

Foi implementado um fluxo completo validando a principal jornada do sistema.

#### Fluxo E2E:
- Criação de administrador
- Login administrador
- Criação de filme
- Criação de teatro
- Criação de sessão
- Registro e login de usuário
- Criação de reserva

Esse fluxo valida a integração entre múltiplos serviços da API, garantindo o funcionamento do sistema de ponta a ponta.

#### Cenários positivos:
- Criação de reserva válida
- Criação de reserva com múltiplos assentos
- Consulta de histórico de reservas do usuário

#### Cenários negativos:
- Criar reserva sem token → **401**
- Criar reserva sem assentos → **400**
- Reservar assento já ocupado → **400 ou 409**
- Criar reserva com token inválido → **401**
- Criar reserva com sessão inexistente → **400 ou 404**

---

## Tipo de Cobertura

- **Path Coverage:** endpoints principais de autenticação, filmes e reservas
- **Operator Coverage:** métodos GET e POST
- **Fluxo E2E:** validado com sucesso
- **Testes Negativos:** implementados nas rotas críticas

---

## Pontos Fortes

- Validação de fluxos críticos do sistema
- Cobertura de cenários positivos e negativos
- Testes de autenticação e autorização
- Validação de regras de negócio
- Uso de dados dinâmicos (evitando conflitos de teste)
- Testes de integração entre múltiplos endpoints
- Execução de cenário completo de negócio (E2E)
- Validação de respostas da API

---

## Limitações Atuais

Ainda não foram automatizados:

- Métodos **PUT e DELETE**
- Validação completa de **schema de resposta**
- Testes de endpoints específicos (**GET por ID**)
- Cobertura mais ampla de cenários de borda

---

## Próximos Passos

Para evolução da cobertura, recomenda-se:

- Implementar validação de schema de resposta
- Expandir cenários negativos (casos de borda)
- Criar testes isolados por endpoint
- Adicionar cobertura para métodos PUT e DELETE
- Melhorar validações de resposta (conteúdo e estrutura)

---

## Objetivo

Aumentar a **confiabilidade, robustez e qualidade da API**, garantindo que o sistema se comporte corretamente tanto em cenários esperados quanto em situações de erro.
