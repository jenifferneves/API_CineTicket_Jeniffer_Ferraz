*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Fluxo Auth Completo
    Create Session    api    ${BASE_URL}

    # gera email único
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    teste_${random}@email.com

    ${user}=    Create Dictionary
    ...    name=Teste Usuario
    ...    email=${email}
    ...    password=12345678

    ${register}=    POST On Session    api    /api/v1/auth/register    json=${user}

    Log    ${register.text}

    Should Be True    ${register.status_code} == 200 or ${register.status_code} == 201

    # login
    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=12345678

    ${response}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    Log    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=    Set Variable    ${response.json()}

    Log    ${response.text}
    Log    ${json}

Validar retorno do token JWT
    Create Session    api    ${BASE_URL}

    # gerar email único
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    jwt_${random}@email.com

    # cadastrar usuário
    ${user}=    Create Dictionary
    ...    name=Usuario JWT
    ...    email=${email}
    ...    password=12345678

    ${register}=    POST On Session
    ...    api
    ...    /api/v1/auth/register
    ...    json=${user}

    Should Be True
    ...    ${register.status_code} == 200 or ${register.status_code} == 201

    # login
    ${login}=    Create Dictionary
    ...    email=${email}
    ...    password=12345678

    ${response}=    POST On Session
    ...    api
    ...    /api/v1/auth/login
    ...    json=${login}

    Log    ${response.text}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    200

    ${json}=    Set Variable    ${response.json()}

    # validar estrutura
    Dictionary Should Contain Key    ${json['data']}    token

    ${token}=    Set Variable    ${json['data']['token']}

    # validar token não vazio
    Should Not Be Empty    ${token}