*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Fluxo Admin Completo
    Create Session    api    ${BASE_URL}

    # 🔹 gerar email único (pra não dar conflito)
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    # 🔹 criar admin
    ${admin_body}=    Create Dictionary
    ...    name=Admin User
    ...    email=${email}
    ...    password=admin123

    ${create_admin}=    POST On Session    api    /api/v1/setup/admin    json=${admin_body}

    Log    ${create_admin.text}

    Should Be True    ${create_admin.status_code} == 200 or ${create_admin.status_code} == 201

    # login admin
    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=admin123

    ${response}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    Log    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=    Set Variable    ${response.json()}

    ${token}=    Set Variable    ${json['data']['token']}

    Log    TOKEN ADMIN: ${token}

    Log    ${response.json()}