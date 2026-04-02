Casos de Teste Back-end

US-MOVIE-01 -- Navegar Filmes

CT-B01 - Listar filmes disponíveis
Resultado esperado:
    • Status 200 OK
    • Retorno com lista de filmes no response
    • Campos presentes: title, duration, genres, poster

US-MOVIE-02 -- Detalhes do Filme

CT-B01 - Buscar detalhes do filme por ID
Resultado esperado:
    • Status 200 OK
    • Retorno com dados do filme: title, synopsis, director, duration, releaseDate

US-MOVIE-03 -- Testes Negativos (Filmes)

CT-B01 - Criar filme com campo obrigatório vazio
Resultado esperado:
    • sistema retorna erro de validação
    • status 400
    • mensagem informando campos obrigatórios
CT-B02 - Criar filme com duração inválida (ex: negativa ou zero)
Resultado esperado:
    • sistema bloqueia criação
    • status 400
    • mensagem informando valor inválido
CT-B03 - Criar filme sem autenticação (Sem token)
Resultado esperado:
    • acesso negado
    • status 401
    • mensagem “Not authorized”
