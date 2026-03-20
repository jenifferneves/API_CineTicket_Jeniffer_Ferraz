Cenários de Teste

quarta-feira, 18 de março de 2026
00:43

Casos de teste

US-AUTH-01 -- Registro de Usuário

CT01 - Registrar usuário com dados válidos 
Resultado esperado: conta criada com sucesso e usuário redirecionado para o login
CT02 - Registrar com e-mail inválido
Resultado esperado: sistema exibe erro da validação
CT03 - Registrar com e-mail duplicado
Resultado esperado: sistema bloqueia cadastro e informa que e-mail já existe
CT04 - Registrar sem preencher campos obrigatórios 
Resultado esperado: sistema solicita preenchimento dos campos

US-AUTH-02 -- Login

CT01 - Login com credenciais válidas
Resultado esperado: usuário autenticado e redirecionado para home
CT02 - Login com senha incorreta
Resultado esperado: sistema exibe erro de autenticação
CT03 - Verificar geração de token JWT
Resultado esperado: token JWT retornado no corpo da resposta

US-AUTH-03 -- Acesso sem token

CT01 - Acessar rota protegida sem token
Resultado esperado: 401 Unauthorized
CT02 - Token inválido
Resultado esperado: acesso negado

US-MOVIE-01 -- Navegar Filmes

CT01 - Listar filmes disponíveis
Resultado esperado:
	• Status 200 OK
	• Retorno com lista de filmes no response
	• Campos presentes: title, duration, genres, poster

US-MOVIE-02 -- Detalhes do Filme

CT01 - Buscar detalhes do filme por ID
Resultado esperado:
	• Status 200 OK
	• Retorno com dados do filme: title, synopsis, director, duration, releaseDate

US-MOVIE-03 -- Gerenciamento de filmes (CRUD completo)

CT01 - Criar filme (Admin)
Resultado esperado:
• filme criado com sucesso
• status 201
CT02 - Atualizar filme
Resultado esperado:
• filme atualizado com sucesso
• status 200
CT03 - Deletar filme
Resultado esperado:
• filme removido com sucesso
• status 200 ou 204
CT04 - Criar filme sem token
Resultado esperado:
• acesso negado
• status 401

US-MOVIE-04 -- Testes Negativos (Filmes)

CT01 - Criar filme com campo obrigatório vazio
Resultado esperado:
	• sistema retorna erro de validação
	• status 400
	• mensagem informando campos obrigatórios
CT02 - Criar filme com duração inválida (ex: negativa ou zero)
Resultado esperado:
	• sistema bloqueia criação
	• status 400
	• mensagem informando valor inválido
CT03 - Criar filme sem autenticação (Sem token)
Resultado esperado:
	• acesso negado
	• status 401
	• mensagem “Not authorized”

US-SESSION-01 -- Visualizar sessões

CT01 - Listar sessões disponíveis
Resultado esperado:
	• Status 200 OK
	• Retorno com dados: datetime, movie, theater, seats

US-RESERVE-01 -- Seleção de assentos

CT01 - Criar reserva com assento disponível
Resultado esperado:
	• Status 201 Created
	• Assento atualizado para status "occupied"
	• Retorno com totalPrice calculado
CT02 - Tentar reservar assento já ocupado
Resultado esperado:
	• Status 400 ou 409
	• Mensagem informando indisponibilidade
CT03 - Criar reserva com múltiplos assentos
Resultado esperado:
	• Status 201
	• Todos os assentos incluídos na reserva
	• totalPrice calculado corretamente

US-RESERVE-02 -- Checkout

CT01 - Criar reserva com sucesso
Resultado esperado:
	• Status 201
	• Reserva criada com status = confirmed
	• Assentos atualizados para "occupied"
CT02 - Validar dados da reserva retornada
Resultado esperado:
	• Response contém seats
	• Response contém totalPrice
CT03 - Validar processamento de pagamento
Resultado esperado:
	• Campo paymentStatus = completed

US-RESERVE-03 -- Histórico de Reservas

CT01 - Listar reservas do usuário
Resultado esperado:
	• Status 200
	• Retorno com lista de reservas
CT02 - Buscar detalhe de reserva por ID
Resultado esperado:
	• Status 200
	• Retorno com dados: movie, datetime, seats, status

US-RESERVE-04 -- Testes negativos (Reserva / Checkout)

CT01 - Criar reserva sem assentos
Resultado esperado:
	• Status 400
	• Mensagem de erro
CT02 - Criar reserva sem autenticação
Resultado esperado:
	• Status 401 Unauthorized
CT03 - Reservar assento já ocupado
Resultado esperado:
	• Status 400 ou 409
	• Mensagem de erro

US-FLOW-01 -- Fluxo Completo

CT01 - Fluxo completo via API
Passos:
	1. Criar usuário
	2. Realizar login
	3. Criar filme
	4. Criar teatro
	5. Criar sessão
	6. Criar reserva
Resultado esperado:
	• Todas as requisições retornam sucesso
	• Reserva criada com sucesso
