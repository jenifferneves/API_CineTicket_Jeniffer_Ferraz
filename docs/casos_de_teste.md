US-AUTH-01 � Registro de Usu�rio
| ID   | Cen�rio                             | Resultado Esperado                                     |
| ---- | ----------------------------------- | ------------------------------------------------------ |
| CT01 | Registrar usu�rio com dados v�lidos | Conta criada com sucesso e redirecionamento para login |
| CT02 | Registrar com e-mail inv�lido       | Sistema exibe erro de valida��o                        |
| CT03 | Registrar com e-mail duplicado      | Sistema bloqueia cadastro e informa duplicidade        |
| CT04 | Registrar sem campos obrigat�rios   | Sistema solicita preenchimento                         |

----

US-AUTH-02 � Login
| ID   | Cen�rio                        | Resultado Esperado          |
| ---- | ------------------------------ | --------------------------- |
| CT01 | Login com credenciais v�lidas  | Usu�rio autenticado         |
| CT02 | Login com senha incorreta      | Erro de autentica��o        |
| CT03 | Verificar gera��o de token JWT | Token retornado na resposta |

----

US-AUTH-03 � Acesso sem Token
| ID   | Cen�rio                          | Resultado Esperado      |
| ---- | -------------------------------- | ----------------------- |
| CT01 | Acessar rota protegida sem token | Status 401 Unauthorized |
| CT02 | Token inv�lido                   | Acesso negado           |

----

US-MOVIE-01 � Navegar Filmes
| ID   | Cen�rio                   | Resultado Esperado                                                      |
| ---- | ------------------------- | ----------------------------------------------------------------------- |
| CT01 | Listar filmes dispon�veis | Status 200 + lista de filmes + campos (title, duration, genres, poster) |

----

US-MOVIE-02 � Detalhes do Filme
| ID   | Cen�rio             | Resultado Esperado                                                    |
| ---- | ------------------- | --------------------------------------------------------------------- |
| CT01 | Buscar filme por ID | Status 200 + dados (title, synopsis, director, duration, releaseDate) |

----

US-MOVIE-03 � CRUD de Filmes
| ID   | Cen�rio               | Resultado Esperado            |
| ---- | --------------------- | ----------------------------- |
| CT01 | Criar filme (Admin)   | Status 201 + filme criado     |
| CT02 | Atualizar filme       | Status 200 + filme atualizado |
| CT03 | Deletar filme         | Status 200 ou 204             |
| CT04 | Criar filme sem token | Status 401                    |

----

US-MOVIE-04 � Testes Negativos
| ID   | Cen�rio                          | Resultado Esperado             |
| ---- | -------------------------------- | ------------------------------ |
| CT01 | Criar filme com campo vazio      | Status 400 + erro de valida��o |
| CT02 | Criar filme com dura��o inv�lida | Status 400 + erro              |
| CT03 | Criar filme sem autentica��o     | Status 401                     |

----

US-SESSION-01 � Sess�es
| ID   | Cen�rio                    | Resultado Esperado                                   |
| ---- | -------------------------- | ---------------------------------------------------- |
| CT01 | Listar sess�es dispon�veis | Status 200 + dados (datetime, movie, theater, seats) |

----

US-RESERVE-01 � Sele��o de Assentos
| ID   | Cen�rio                     | Resultado Esperado                        |
| ---- | --------------------------- | ----------------------------------------- |
| CT01 | Reservar assento dispon�vel | Status 201 + assento ocupado + totalPrice |
| CT02 | Reservar assento j� ocupado | Status 400 ou 409                         |
| CT03 | Reservar m�ltiplos assentos | Status 201 + c�lculo correto              |

----

US-RESERVE-02 � Checkout
| ID   | Cen�rio                   | Resultado Esperado            |
| ---- | ------------------------- | ----------------------------- |
| CT01 | Criar reserva com sucesso | Status 201 + status confirmed |
| CT02 | Validar dados da reserva  | Cont�m seats e totalPrice     |
| CT03 | Validar pagamento         | paymentStatus = completed     |

----

US-RESERVE-03 � Hist�rico
| ID   | Cen�rio               | Resultado Esperado           |
| ---- | --------------------- | ---------------------------- |
| CT01 | Listar reservas       | Status 200                   |
| CT02 | Buscar reserva por ID | Status 200 + dados completos |

----

US-RESERVE-04 � Testes Negativos
| ID   | Cen�rio                    | Resultado Esperado |
| ---- | -------------------------- | ------------------ |
| CT01 | Criar reserva sem assentos | Status 400         |
| CT02 | Criar reserva sem token    | Status 401         |
| CT03 | Reservar assento ocupado   | Status 400 ou 409  |

----

US-FLOW-01 � Fluxo Completo
| ID   | Cen�rio            | Resultado Esperado                             |
| ---- | ------------------ | ---------------------------------------------- |
| CT01 | Fluxo completo API | Todas requisi��es com sucesso + reserva criada |

Passos:

* Criar usu�rio

* Login

* Criar filme

* Criar teatro

* Criar sess�o

* Criar reserva