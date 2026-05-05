*** Settings ***
Library    RequestsLibrary
Library    Collections

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

    Should Be True    ${res.status_code} == 400 or ${res.status_code} == 401


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

    Should Be Equal As Integers    ${res.status_code}    401