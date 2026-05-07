*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***

Login com senha inválida
    Create Session    api    ${BASE_URL}

    ${body}=    Create Dictionary
    ...    email=teste@email.com
    ...    password=senha_errada

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/auth/login
    ...    json=${body}
    ...    expected_status=any

    Log    ${res.text}

    Should Be True
    ...    ${res.status_code} == 400 or ${res.status_code} == 401


Login com email inválido
    Create Session    api    ${BASE_URL}

    ${body}=    Create Dictionary
    ...    email=email_invalido
    ...    password=12345678

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/auth/login
    ...    json=${body}
    ...    expected_status=any

    Log    ${res.text}

    Should Be Equal As Integers
    ...    ${res.status_code}
    ...    401


Registrar usuário com email duplicado
    Create Session    api    ${BASE_URL}

    # gera email único
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    duplicado_${random}@email.com

    ${user}=    Create Dictionary
    ...    name=Teste Duplicado
    ...    email=${email}
    ...    password=12345678

    # primeiro cadastro
    ${first}=    POST On Session
    ...    api
    ...    /api/v1/auth/register
    ...    json=${user}

    Log    ${first.text}

    Should Be True
    ...    ${first.status_code} == 200 or ${first.status_code} == 201

    # tenta cadastrar novamente com mesmo email
    ${duplicate}=    POST On Session
    ...    api
    ...    /api/v1/auth/register
    ...    json=${user}
    ...    expected_status=any

    Log    ${duplicate.text}

    # valida erro esperado
    Should Be True
    ...    ${duplicate.status_code} == 400 or ${duplicate.status_code} == 409