*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***

Criar reserva sem token
    Create Session    api    ${BASE_URL}

    ${reservation}=    Create Dictionary
    ...    session=123
    ...    seats=@{EMPTY}

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    401


Criar reserva sem assentos
    Create Session    api    ${BASE_URL}

    ${token}=    Criar Usuario E Retornar Token

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${reservation}=    Create Dictionary
    ...    session=123
    ...    seats=@{EMPTY}

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    400


Reservar assento já ocupado
    Create Session    api    ${BASE_URL}

    ${token}=    Criar Usuario E Retornar Token

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${reservation}=    Create Dictionary
    ...    session=123
    ...    seats=A1

    ${res1}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be True    ${res.status_code} == 400 or ${res.status_code} == 409

Criar reserva com token inválido
    Create Session    api    ${BASE_URL}

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer token_fake

    ${reservation}=    Create Dictionary
    ...    session=123
    ...    seats=@{EMPTY}

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers    ${res.status_code}    401

Criar reserva com sessão inexistente
    Create Session    api    ${BASE_URL}

    ${token}=    Criar Usuario E Retornar Token

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${seat}=    Create Dictionary
    ...    row=A
    ...    number=1
    ...    type=full

    ${seats}=    Create List    ${seat}

    ${reservation}=    Create Dictionary
    ...    session=999999999999
    ...    seats=${seats}
    ...    paymentMethod=credit_card

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be True
    ...    ${res.status_code} == 400 or ${res.status_code} == 404

Criar reserva com múltiplos assentos
    Create Session    api    ${BASE_URL}

    ${token}=    Criar Usuario E Retornar Token

    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${token}

    ${seat1}=    Create Dictionary
    ...    row=A
    ...    number=1
    ...    type=full

    ${seat2}=    Create Dictionary
    ...    row=A
    ...    number=2
    ...    type=half

    ${seats}=    Create List    ${seat1}    ${seat2}

    ${reservation}=    Create Dictionary
    ...    session=123
    ...    seats=${seats}
    ...    paymentMethod=credit_card

    ${res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${headers}
    ...    expected_status=any

    Should Be Equal As Integers
    ...    ${res.status_code}
    ...    201


*** Keywords ***

Criar Usuario E Retornar Token
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    user_${random}@email.com

    ${user}=    Create Dictionary
    ...    name=User
    ...    email=${email}
    ...    password=123456

    POST On Session
    ...    api
    ...    /api/v1/setup/admin
    ...    json=${user}
    ...    expected_status=any

    ${login}=    Create Dictionary
    ...    email=${email}
    ...    password=123456

    ${res_login}=    POST On Session
    ...    api
    ...    /api/v1/auth/login
    ...    json=${login}
    ...    expected_status=any

    ${json}=    Set Variable    ${res_login.json()}
    ${token}=    Set Variable    ${json['data']['token']}

    RETURN    ${token}
