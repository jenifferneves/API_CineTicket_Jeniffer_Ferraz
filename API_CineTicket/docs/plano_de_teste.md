
   Plano de Teste Sistema de Cinema (CineTicket) - API Cinema
   
1.  Objetivo
	Este plano de teste tem como objetivo validar a qualidade da API do sistema de cinema (CineTicket), garantindo que as funcionalidades principais operem corretamente e que o sistema seja capaz de suportar múltiplos usuários simultaneamente.
	
	Os testes visam identificar defeitos, validar os requisitos funcionais definidos nas histórias de usuário e avaliar o comportamento do sistema em diferentes cenários.
	
2. Escopo do Teste
	Serão testadas as principais funcionalidades da plataforma relacionadas ao fluxo de compra de ingressos. 
	
	Funcionalidades incluídas
	• Registro de usuário
	• Login e autenticação 
	• Navegação de filmes
	• Visualização de detalhes do filme
	• Visualização de sessões
	• Seleção de assentos
	• Processo de checkout
	• Visualização de reservas
	
	Essas funcionalidades são baseadas nas User Stories definidas no projeto Cinema App.
	
3. Tipos de Testes Realizados 
	Para garantir uma validação completa do sistema, foram aplicados diferentes tipos de testes.
	
	Testes Funcionais
	Validações das funcionalidades principais do sistema com base nas histórias de usuário.
	Exemplo:
	• Registro de usuário
	• Login
	• Criação de filmes
	• Seleção de assentos
	• Finalização de compra
	
	Testes de API
	Validação da API responsável pelas funcionalidades do sistema. 
	Foram testadas rotas relacionadas a:
	• Autenticação 
	• Filmes
	• Sessões
	• Reservas
	Objetivo:
	• Verificar respostas corretas da API
	• Validar códigos de status HTTP
	• Validar estrutura dos dados retornados
	
	Testes Automatizados 
	Cenários críticos do sistema foram automatizados para garantir repetibilidade e eficiência na execução dos testes.
	Cenários automatizados:
		• Consulta de filmes
		• Busca por ID
		• Autenticação (login + token)
		• Criação de reservas
		
	Testes de Performance
	Foram registrados testes de carga para avaliar o comportamento do sistema sob múltiplos acessos simultâneos. 
	Ferramenta utilizada: Apache Jmeter
	
	Cenário testado:
	• Múltiplos usuários acessando a listagem de filmes.
	Métricas analisadas:
	• Tempo de resposta
	• Throughput
	• Taxa de erro

4. Estratégia de Teste
	A estratégia adotada foi baseada na validação das Histórias de usuários do sistema.
	O processo de teste seguiu as seguintes etapas:
	
	• Análise das histórias de usuário
	• Criação dos casos de teste
	• Execução manual dos testes
	• Registros de defeitos encontrados 
	• Automação de cenários críticos 
	• Execução de teste de API
	• Execução de testes de performance

5. Ambiente de Teste
	Os testes foram executados utilizando o ambiente local configurado com os seguintes componentes:
	
	Backend: 
	• Node.js
	• API Cinema challenge

	Ferramentas utilizadas:
	• Postman (testes manuais e automação)
	• Apache JMeter
	• JavaScript
	• XMind (mapa mental)
	• GitHub (versionamento)
	• OneNote (documentação)

6. Critérios de Sucesso
	Os testes são considerados bem-sucedidos quando:
	• As funcionalidades atendem aos critérios de aceitação das histórias de usuário
	• A API retorna respostas correta
	• Não existe erros críticos que que impeçam o fluxo de reserva
	• O sistema responde corretamente durante o teste de carga.

7. Riscos e Limitações 
	Algumas limitações podem impactar os testes:
	• Ambiente local pode não refletir exatamente o ambiente de produção
	• Testes de pagamento utilizam simulação 
	• Tempo limitado para execução completa de todos os cenários possíveis.
	
	

	
	
	
	


	


