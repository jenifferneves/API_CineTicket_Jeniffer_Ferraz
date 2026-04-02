# 🎬 Casos de Teste - Backend

## 🧾 User Story: US-MOVIE-01 - Navegar Filmes

| ID     | Cenário                       | Ação                          | Resultado Esperado |
|--------|------------------------------|-------------------------------|--------------------|
| CT-B01 | Listar filmes disponíveis    | Realizar GET /movies          | Status 200 OK e retorno com lista de filmes contendo: title, duration, genres, poster |
| CT-B02 | Buscar detalhes do filme por ID  | Realizar GET /movies/:id      | Status 200 OK e retorno com dados do filme: title, synopsis, director, duration, releaseDate |

---

## 🧾 User Story: US-MOVIE-02 - Testes Negativos (Filmes)

| ID     | Cenário                                      | Ação                                  | Resultado Esperado |
|--------|---------------------------------------------|----------------------------------------|--------------------|
| CT-B01 | Criar filme com campo obrigatório vazio      | Realizar POST /movies com dados inválidos | Status 400 e mensagem de erro informando campos obrigatórios |
| CT-B02 | Criar filme com duração inválida             | Realizar POST /movies com duração inválida | Status 400 e mensagem informando valor inválido |
| CT-B03 | Criar filme sem autenticação (sem token)     | Realizar POST /movies sem token         | Status 401 e mensagem "Not authorized" |
