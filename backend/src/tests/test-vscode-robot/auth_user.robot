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

Criar filme com usuário comum
    Create Session    api    ${BASE_URL}

    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    user_${random}@email.com

    ${user}=    Create Dictionary
    ...    name=User
    ...    email=${email}
    ...    password=123456

    POST On Session    api    /api/v1/auth/register    json=${user}

    ${login}=    Create Dictionary
    ...    email=${email}
    ...    password=123456

    ${res_login}=    POST On Session    api    /api/v1/auth/login    json=${login}

    ${json}=    Set Variable    ${res_login.json()}
    ${token}=    Set Variable    ${json['data']['token']}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${movie}=    Create Dictionary
    ...    title=Filme Bloqueado
    ...    duration=120

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/movies
    ...    json=${movie}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    403