## Cobertura de Testes

A cobertura de testes da API foi analisada com base em critérios de *Input Coverage*, seguindo boas práticas de testes para APIs REST.

Atualmente, a automação contempla:

- **Path Coverage:** 15% dos endpoints cobertos (5 de 33)  
- **Operator Coverage:** 50% dos métodos HTTP cobertos (GET e POST)  

Os testes implementados priorizam endpoints críticos, como autenticação e consulta de dados, garantindo a validação das principais funcionalidades da aplicação.

Além dos cenários positivos, também foram implementados testes negativos, com foco na validação de regras de negócio e no tratamento de dados inválidos.

Foram realizados testes com retornos esperados de erro (como status 400), especialmente nos endpoints de autenticação e reservas, assegurando que a API responda corretamente a entradas inválidas.

---

### Limitações Atuais

Ainda não foram explorados os seguintes cenários:

- Métodos de escrita (PUT e DELETE)  
- Outros códigos de status HTTP  
- Fluxos completos de negócio (ex: criação de reserva ponta a ponta)  

---

### Próximos Passos

Como evolução, pretende-se:

- Aumentar a cobertura de endpoints  
- Incluir testes para métodos de escrita (PUT e DELETE)  
- Ampliar cenários negativos  
- Validar de forma mais abrangente os parâmetros de entrada  
- Implementar testes de fluxo completo (end-to-end)  

O objetivo é elevar o nível de confiabilidade e robustez da API.