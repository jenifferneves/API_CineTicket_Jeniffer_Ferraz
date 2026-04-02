# Documentação de Testes de Integração

## Módulo: Filmes (/movies)

---

## Objetivo

Validar a comunicação entre o frontend e o backend, garantindo que os dados exibidos na interface correspondem corretamente às respostas da API.

---

## Escopo da Integração

- **Endpoint:** `/api/v1/movies`
- **Método:** `GET`

### Integrações Validadas:
- Frontend consome API de listagem de filmes
- Frontend consome API de detalhes por ID
- Tratamento de erros da API no frontend

---

## Casos de Teste de Integração

| ID         | Cenário                         | Ação | Validações | Resultado Esperado |
|------------|--------------------------------|------|------------|--------------------|
| CT-INT-01  | Listagem de filmes integrada   | Acessar tela de filmes | Front realiza GET /movies <br> API responde 200 OK <br> Dados retornados corretamente | Lista exibida corretamente com título, duração, gênero e pôster |
| CT-INT-02  | Consistência de dados          | Comparar API vs Front | Dados exibidos devem ser idênticos aos retornados pela API | Nenhuma divergência de informação |
| CT-INT-03  | Navegação para detalhes        | Clicar em um filme | Front chama GET /movies/{id} <br> API responde 200 OK | Tela exibe título, sinopse, duração e data de lançamento |
| CT-INT-04  | Tratamento de erro da API      | Simular erro (500/offline) | Front recebe erro e trata corretamente | Exibir mensagem de erro sem quebrar a interface |
| CT-INT-05  | Nenhum filme disponível        | API retorna lista vazia [] | Front interpreta resposta corretamente | Exibir mensagem "Nenhum filme disponível" |
| CT-INT-06  | Filme sem pôster (fallback)    | API retorna poster null | Front trata ausência de imagem | Exibir imagem padrão |
| CT-INT-07  | Tempo de resposta da API       | Monitorar resposta | Front aguarda resposta <br> Exibe loading (se houver) | UX não deve quebrar durante carregamento |

---

## Critérios de Aceite

- Todos os dados exibidos no frontend devem vir corretamente da API
- Não deve haver quebra de layout com dados reais
- Erros devem ser tratados de forma amigável
- Navegação entre telas deve funcionar corretamente

---

## Riscos Identificados

- Indisponibilidade da API impacta diretamente o funcionamento do frontend