## US-AUTH-01 — Registro de Usuário
| ID   | Cenário                             | Resultado Esperado                                     |
|------|-------------------------------------|--------------------------------------------------------|
| CT01 | Registrar usuário com dados válidos | Conta criada com sucesso e redirecionamento para login |
| CT02 | Registrar com e-mail inválido       | Sistema exibe erro de validação                        |
| CT03 | Registrar com e-mail duplicado      | Sistema bloqueia cadastro e informa duplicidade        |
| CT04 | Registrar sem campos obrigatórios   | Sistema solicita preenchimento                         |

---

## US-AUTH-02 — Login
| ID   | Cenário                        | Resultado Esperado          |
|------|--------------------------------|-----------------------------|
| CT01 | Login com credenciais válidas  | Usuário autenticado         |
| CT02 | Login com senha incorreta      | Erro de autenticação        |
| CT03 | Verificar geração de token JWT | Token retornado na resposta |

---

## US-AUTH-03 — Acesso sem Token
| ID   | Cenário                          | Resultado Esperado      |
|------|----------------------------------|--------------------------|
| CT01 | Acessar rota protegida sem token | Status 401 Unauthorized |
| CT02 | Token inválido                   | Acesso negado           |

---

## US-MOVIE-01 — Navegar Filmes
| ID   | Cenário                   | Resultado Esperado                                                      |
|------|---------------------------|-------------------------------------------------------------------------|
| CT01 | Listar filmes disponíveis | Status 200 + lista de filmes + campos (title, duration, genres, poster) |

---

## US-MOVIE-02 — Detalhes do Filme
| ID   | Cenário             | Resultado Esperado                                                    |
|------|---------------------|------------------------------------------------------------------------|
| CT01 | Buscar filme por ID | Status 200 + dados (title, synopsis, director, duration, releaseDate) |

---

## US-MOVIE-03 — CRUD de Filmes
| ID   | Cenário               | Resultado Esperado            |
|------|-----------------------|-------------------------------|
| CT01 | Criar filme (Admin)   | Status 201 + filme criado     |
| CT02 | Atualizar filme       | Status 200 + filme atualizado |
| CT03 | Deletar filme         | Status 200 ou 204             |
| CT04 | Criar filme sem token | Status 401                    |

---

## US-MOVIE-04 — Testes Negativos
| ID   | Cenário                          | Resultado Esperado             |
|------|----------------------------------|--------------------------------|
| CT01 | Criar filme com campo vazio      | Status 400 + erro de validação |
| CT02 | Criar filme com duração inválida | Status 400 + erro              |
| CT03 | Criar filme sem autenticação     | Status 401                     |

---

## US-SESSION-01 — Sessões
| ID   | Cenário                    | Resultado Esperado                                   |
|------|----------------------------|------------------------------------------------------|
| CT01 | Listar sessões disponíveis | Status 200 + dados (datetime, movie, theater, seats) |

---

## US-RESERVE-01 — Seleção de Assentos
| ID   | Cenário                     | Resultado Esperado                        |
|------|-----------------------------|-------------------------------------------|
| CT01 | Reservar assento disponível | Status 201 + assento ocupado + totalPrice |
| CT02 | Reservar assento já ocupado | Status 400 ou 409                         |
| CT03 | Reservar múltiplos assentos | Status 201 + cálculo correto              |

---

## US-RESERVE-02 — Checkout
| ID   | Cenário                   | Resultado Esperado            |
|------|---------------------------|-------------------------------|
| CT01 | Criar reserva com sucesso | Status 201 + status confirmed |
| CT02 | Validar dados da reserva  | Contém seats e totalPrice     |
| CT03 | Validar pagamento         | paymentStatus = completed     |

---

## US-RESERVE-03 — Histórico
| ID   | Cenário               | Resultado Esperado           |
|------|-----------------------|-------------------------------|
| CT01 | Listar reservas       | Status 200                   |
| CT02 | Buscar reserva por ID | Status 200 + dados completos |

---

## US-RESERVE-04 — Testes Negativos
| ID   | Cenário                    | Resultado Esperado |
|------|----------------------------|--------------------|
| CT01 | Criar reserva sem assentos | Status 400         |
| CT02 | Criar reserva sem token    | Status 401         |
| CT03 | Reservar assento ocupado   | Status 400 ou 409  |

---

## US-FLOW-01 — Fluxo Completo
| ID   | Cenário            | Resultado Esperado                             |
|------|--------------------|-----------------------------------------------|
| CT01 | Fluxo completo API | Todas requisições com sucesso + reserva criada |

### Passos:
- Criar usuário  
- Login  
- Criar filme  
- Criar teatro  
- Criar sessão  
- Criar reserva  