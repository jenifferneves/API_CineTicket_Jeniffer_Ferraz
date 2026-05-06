*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***

Criar Filme
    Create Session    api    ${BASE_URL}

    # criar admin
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    ${admin_body}=    Create Dictionary
    ...    name=Admin User
    ...    email=${email}
    ...    password=admin123

    POST On Session    api    /api/v1/setup/admin    json=${admin_body}

    # login admin
    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=admin123

    ${response}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    ${json}=    Set Variable    ${response.json()}
    ${token}=    Set Variable    ${json['data']['token']}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    # criar filme
    ${genres}=    Create List    Drama

    ${movie}=    Create Dictionary
    ...    title=Filme Teste
    ...    synopsis=Um filme de teste automatizado
    ...    director=Diretor Teste
    ...    genres=${genres}
    ...    duration=120
    ...    classification=16
    ...    poster=teste.jpg
    ...    releaseDate=2026-04-08

    ${create}=    POST On Session    api    /api/v1/movies    json=${movie}    headers=${headers}

    Log    ${create.text}

    Should Be True    ${create.status_code} == 200 or ${create.status_code} == 201

    ${movie_json}=    Set Variable    ${create.json()}

    # valida resposta
    Should Be True    ${movie_json['success']}
    Should Not Be Empty    ${movie_json['data']}

    Dictionary Should Contain Key    ${movie_json['data']}    title
    Dictionary Should Contain Key    ${movie_json['data']}    duration
    Dictionary Should Contain Key    ${movie_json['data']}    genres
    Dictionary Should Contain Key    ${movie_json['data']}    director


Listar Filmes
    Create Session    api    ${BASE_URL}

    # criar admin
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    ${admin_body}=    Create Dictionary
    ...    name=Admin User
    ...    email=${email}
    ...    password=admin123

    POST On Session    api    /api/v1/setup/admin    json=${admin_body}

    # login admin
    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=admin123

    ${response}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    ${json}=    Set Variable    ${response.json()}
    ${token}=    Set Variable    ${json['data']['token']}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    # listar filmes
    ${movies}=    GET On Session    api    /api/v1/movies    headers=${headers}

    Log    ${movies.text}

    Should Be Equal As Integers    ${movies.status_code}    200

    ${movies_json}=    Set Variable    ${movies.json()}

    # valida resposta geral
    Should Be True    ${movies_json['success']}
    Should Be True    ${movies_json['count']} > 0
    Should Not Be Empty    ${movies_json['data']}

    # pega primeiro filme
    ${data}=    Set Variable    ${movies_json['data']}
    ${movie}=    Get From List    ${data}    0

    # valida estrutura correta (INGLÊS)
    Dictionary Should Contain Key    ${movie}    title
    Dictionary Should Contain Key    ${movie}    duration
    Dictionary Should Contain Key    ${movie}    genres
    Dictionary Should Contain Key    ${movie}    director

    # valida conteúdo
    Should Not Be Empty    ${movie['title']}
    Should Be True    ${movie['duration']} > 0

Criar filme com token inválido
    Create Session    api    ${BASE_URL}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer token_fake

    ${movie}=    Create Dictionary
    ...    title=Filme Fake
    ...    duration=120

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/movies
    ...    json=${movie}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    401

Criar filme com token mal formatado
    Create Session    api    ${BASE_URL}

    ${headers}=    Create Dictionary
    ...    Authorization=123456

    ${movie}=    Create Dictionary
    ...    title=Filme Erro Header
    ...    duration=120

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/movies
    ...    json=${movie}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    401