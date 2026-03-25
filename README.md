### CineTicket - QA Challenge

#### Sobre o Projeto
Este projeto tem como objetivo validar a qualidade da API de um sistema de venda de ingressos de cinema(CineTicket), garantindo que suas funcionalidades
principais operem corretamente e que o sistema suporte múltiplos usuários simultaneamente.
Foram realizados testes funcionais, testes de API, automação de cenários críticos e testes de performance.

----

#### Objetivo dos Testes
1. Validar funcionalidades principais do sistema
2. Garantir conformidade com as regras de negócio
3. Identificar defeitos
4. Avaliar comportamento da API sob carga

----

#### Escopo de Teste
As seguintes funcionalidades foram testadas:

- Registro de usuário
- Login e autenticação
- Navegação de filmes
- Detalhes do filme
- Visualização de sessões
- Seleção de assentos
- Checkout
- Histórico de reservas

Simulação de um fluxo completo via API, avaliando o comportamento do sistema com base nas ações do usuário, desde o registro até a finalização da compra.

----

#### Tipo de Testes Realizados

##### Testes Funcionais (Manuais)
Foram realizados testes manuais utilizando o Postman, seguindo o fluxo real do usuário e validando a maioria das rotas da aplicação.

Exemplos:

- Registro de usuário
- Login
- Criação de filmes
- Criação de Teatro
- Seleção de assentos
- Checkout

##### Testes de API

Validação das rotas, incluindo:

- Status HTTP
- Estrutura de resposta
- Regras de negócio

##### Automação de Testes

Automação dos cenários críticos, priorizando os fluxos mais importantes do sistema, como autenticação, consulta de filmes e criação de reservas.

##### Testes de Performance

Os testes de carga foram realizados utilizando o Apache JMeter, focando em rotas com maior volume de acesso simultâneo.

Endpoints testados:

- GET /api/v1/movies
- GET /api/v1/sessions

----

#### Estratégia de Teste

A estratégia foi baseada nas histórias de usuário e seguiu as etapas:

1. Análise das funcionalidades
2. Criação dos casos de teste
3. Execução de testes manuais
4. Registro de defeitos
5. Automação de cenários críticos
6. Testes de API
7. Testes de performance

----

#### Branch de Automação

Este repositório possui uma branch adicional chamada qa_automation, onde está organizada toda a estrutura de testes desenvolvida durante o projeto.

Nela estão incluídos:

- Casos de teste
- Plano de teste
- Evidências dos testes executados
- Testes automatizados no Postman
- Scripts de testes de performance (JMeter)
- Mapa mental do projeto

Essa organização foi criada com foco em clareza, padronização e facilidade de manutenção.

----

#### Defeitos identificados
- Falha de autenticação no Swagger (JWT não aplicado corretamente)
- Criação de filmes com duração inválida (validação incorreta da API)

----

#### Melhorias Identificadas
- Melhorar validação de dados na API
- Corrigir autenticação no Swagger para permitir testes manuais
- Melhorar organização e padronização das rotas no Swagger

----

#### Conclusão

O sistema apresentou bom funcionamento nos fluxos principais, com alguns pontos de melhoria identificados.

Os testes de performance indicaram que a aplicação suporta acessos simultâneos nas rotas principais sem falhas críticas.

----

#### Contato

Caso queira trocar experiências ou saber mais sobre o projeto:

LinkedIn: www.linkedin.com/in/jeniffer-ferraz-42166a254