## Cobertura de Testes

A cobertura de testes da API foi analisada com base na automação implementada utilizando Robot Framework.

### Cobertura Atual

Atualmente, os testes automatizados contemplam os seguintes cenários:

#### Autenticação
- Registro de usuário  
- Login com credenciais válidas  
- Geração de token JWT  

#### Administração
- Criação de usuário administrador  

#### Filmes
- Criação de filmes (endpoint protegido)  
- Listagem de filmes  

#### Reservas (Fluxo End-to-End)
Foi implementado um fluxo completo validando a principal jornada do sistema:
- Criação de filme  
- Criação de teatro  
- Criação de sessão  
- Registro e login de usuário  
- Criação de reserva  

Esse fluxo valida a integração entre múltiplos serviços da API, garantindo o funcionamento do sistema de ponta a ponta.

---

### Tipo de Cobertura

- **Path Coverage:** endpoints principais de autenticação, filmes e reservas  
- **Operator Coverage:** métodos GET e POST  
- **Fluxo E2E:** validado com sucesso  

---

### Pontos Fortes

- Validação de fluxos críticos do sistema  
- Uso de dados dinâmicos (evitando conflitos de teste)  
- Testes de integração entre múltiplos endpoints  
- Execução de cenário completo de negócio  

---

### Limitações Atuais

Ainda não foram automatizados:

- Testes negativos (erros de autenticação, validação de dados)  
- Métodos PUT e DELETE  
- Validação detalhada do corpo da resposta  
- Testes específicos de endpoints individuais (GET por ID)  

---

### Próximos Passos

Para evolução da cobertura, recomenda-se:

- Implementar testes negativos  
- Adicionar validação de schema/resposta  
- Criar testes isolados por endpoint  
- Expandir cenários de erro e borda  

O objetivo é aumentar a confiabilidade, robustez e qualidade da API.