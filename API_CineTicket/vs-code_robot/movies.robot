*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Listar Filmes
    Create Session    api    ${BASE_URL}

    # 🔹 criar admin
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    ${admin_body}=    Create Dictionary
    ...    name=Admin User
    ...    email=${email}
    ...    password=admin123

    POST On Session    api    /api/v1/setup/admin    json=${admin_body}

    # 🔹 login admin
    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=admin123

    ${response}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    ${json}=    Set Variable    ${response.json()}
    ${token}=    Set Variable    ${json['data']['token']}

    
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    
    ${movies}=    GET On Session    api    /api/v1/movies    headers=${headers}

    Log    ${movies.text}

    Should Be Equal As Integers    ${movies.status_code}    200

    ${movies_json}=    Set Variable    ${movies.json()}

    Should Not Be Empty    ${movies_json}