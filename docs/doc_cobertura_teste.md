# Cobertura de Testes da API

A cobertura de testes da API foi analisada com base na automação implementada utilizando **Robot Framework**, contemplando cenários positivos, negativos e fluxos de integração entre serviços.

---

## Cobertura Atual

Atualmente, os testes automatizados contemplam os seguintes cenários:

### Autenticação

**Cenários positivos:**
- Registro de usuário  
- Login com credenciais válidas  
- Geração de token JWT  

**Cenários negativos:**
- Login com senha inválida → retorno **400 ou 401**  
- Login com email inválido → retorno **401**  

---

### Administração

- Criação de usuário administrador  

---

### Filmes

**Cenários positivos:**
- Criação de filmes (endpoint protegido)  
- Listagem de filmes  

**Cenários negativos:**
- Criação de filme sem token → **401 (não autorizado)**  
- Criação de filme com campos inválidos → **400 (bad request)**  

---

### Reservas (Fluxo End-to-End + Negativos)

Foi implementado um fluxo completo validando a principal jornada do sistema:

#### Fluxo E2E:
- Criação de filme  
- Criação de teatro  
- Criação de sessão  
- Registro e login de usuário  
- Criação de reserva  

Esse fluxo valida a integração entre múltiplos serviços da API, garantindo o funcionamento do sistema de ponta a ponta.

#### Cenários negativos:
- Criar reserva sem token → **401**  
- Criar reserva sem assentos → **400**  
- Reservar assento já ocupado → **400 ou 409**  

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

---

## Limitações Atuais

Ainda não foram automatizados:

- Métodos **PUT e DELETE**  
- Validação de **schema de resposta (estrutura do JSON)**  
- Testes de endpoints específicos (**GET por ID**)  
- Cobertura mais ampla de cenários de borda  

---

## Próximos Passos

Para evolução da cobertura, recomenda-se:

- Implementar validação de **schema de resposta**  
- Expandir cenários negativos (casos de borda)  
- Criar testes isolados por endpoint  
- Adicionar cobertura para métodos PUT e DELETE  
- Melhorar validações de resposta (conteúdo e estrutura)  

---

## Objetivo

Aumentar a **confiabilidade, robustez e qualidade da API**, garantindo que o sistema se comporte corretamente tanto em cenários esperados quanto em situações de erro.