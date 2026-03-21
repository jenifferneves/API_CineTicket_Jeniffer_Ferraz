Teste de Performance – API CineTicket

Objetivo

Avaliar o comportamento da API sob carga, simulando múltiplos usuários acessando simultaneamente os principais endpoints do sistema.

Ferramenta Utilizada

* Apache JMeter

Cenário de Teste

O teste foi realizado simulando múltiplos usuários acessando os endpoints de consulta da aplicação, representando o fluxo real de navegação dos usuários.

Endpoints testados:

* GET /api/v1/movies

* GET /api/v1/sessions

Configuração do Teste

Thread Group:

Número de usuários (threads): 10

Ramp-up period: 10 segundos

Loop count: 1

Throughput Timer:

Target throughput: 50 requisições por minuto

Duração do teste: 60 segundos

Métricas Analisadas

Durante a execução, foram monitoradas as seguintes métricas:

Tempo de resposta

Throughput (requisições por segundo)

Taxa de erro

Os dados foram coletados através do Summary Report do JMeter.

Execução do Teste

Iniciar a API localmente (localhost:3000)

Abrir o JMeter

Configurar o Thread Group com os parâmetros definidos

Configurar as requisições HTTP para os endpoints

Executar o teste

Analisar os resultados no Summary Report e na Árvore de Resultados