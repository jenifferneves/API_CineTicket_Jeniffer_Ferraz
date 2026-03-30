### Cobertura dos testes

A cobertura de testes da API foi analisada com base em critérios de Input Coverage, conforme boas práticas de testes em APIs REST.

Atualmente, a automação contempla:

- Path Coverage: 15% dos endpoints cobertos (5 de 33)
- Operator Coverage: 50% dos métodos HTTP cobertos (GET e POST)

Os testes implementados priorizam endpoints críticos, como autenticação e consulta de dados, garantindo a validação das principais funcionalidades da aplicação.

Além dos cenários positivos, também foram implementados testes negativos, com foco na validação de regras de negócio e tratamento de dados inválidos. 
Foram realizados testes com retornos esperados de erro (como status 400), especialmente nos endpoints de autenticação e reservas, assegurando que a API responda corretamente a entradas inválidas.

Ainda não foram explorados cenários de:

- Métodos de escrita (PUT e DELETE)
- Outros status codes
- Fluxos completos de negócio (ex: criação de reserva ponta a ponta)

Como evolução, pretende-se aumentar a cobertura incluindo testes de escrita, ampliação de cenários negativos, validação mais abrangente de parâmetros e execução de fluxos completos, garantindo maior confiabilidade e robustez da API.