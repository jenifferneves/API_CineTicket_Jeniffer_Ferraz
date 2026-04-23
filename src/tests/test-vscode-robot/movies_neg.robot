*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Criar filme sem token
    Create Session    api    ${BASE_URL}

    ${movie}=    Create Dictionary
    ...    title=Filme Sem Token
    ...    duration=120

    ${res}=    POST On Session    
    ...    api    
    ...    /api/v1/movies    
    ...    json=${movie}    
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    401


Criar filme com campo vazio
    Create Session    api    ${BASE_URL}

    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    ${admin}=    Create Dictionary
    ...    name=Admin
    ...    email=${email}
    ...    password=123456

    POST On Session    
    ...    api    
    ...    /api/v1/setup/admin    
    ...    json=${admin}    
    ...    expected_status=any

    ${login}=    Create Dictionary
    ...    email=${email}
    ...    password=123456

    ${res_login}=    POST On Session    
    ...    api    
    ...    /api/v1/auth/login    
    ...    json=${login}    
    ...    expected_status=any

    Should Be Equal As Integers    ${res_login.status_code}    200

    ${json}=    Set Variable    ${res_login.json()}
    Log    ${res_login.json()}

    ${token}=    Set Variable    ${json['data']['token']}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${movie}=    Create Dictionary
    ...    title=
    ...    duration=0

    ${res}=    POST On Session    
    ...    api    
    ...    /api/v1/movies    
    ...    json=${movie}    
    ...    headers=${headers}    
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    400