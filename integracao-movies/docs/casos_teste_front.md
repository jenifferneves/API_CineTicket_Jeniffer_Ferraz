# Casos de Teste - Frontend

## User Story: US-MOVIE-01 - Navegar Filmes

| ID     | Cenário                    | Ação                         | Resultado Esperado |
|--------|---------------------------|------------------------------|--------------------|
| CT-F01 | Listagem de Filmes        | Acessar a página de filmes   | Filmes devem ser exibidos na tela em formato de grid |
| CT-F02 | Informações do Filme      | Acessar lista de filmes      | Cada filme deve exibir: título, duração, gênero e classificação |
| CT-F03 | Imagem do Filme           | Acessar lista de filmes      | O pôster deve ser exibido corretamente, sem erro de carregamento |
| CT-F04 | Filme sem Pôster          | Acessar lista de filmes      | Deve exibir imagem padrão (fallback) |
| CT-F05 | Acessar Detalhes          | Clicar em um filme           | Deve redirecionar para a tela de detalhes |
| CT-F06 | Visualização do Filme     | Acessar tela de detalhes     | Exibir: título, sinopse, duração e data de lançamento |
| CT-F07 | Responsividade            | Redimensionar a tela         | Layout deve se adaptar e os cards não devem quebrar |
| CT-F08 | Nenhum Filme Disponível   | Acessar página sem dados     | Exibir mensagem: "Nenhum filme disponível" |
| CT-F09 | Falha na API              | Acessar página com erro API  | Exibir mensagem de erro sem quebrar a interface |
