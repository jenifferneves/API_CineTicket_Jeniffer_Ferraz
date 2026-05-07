*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    BuiltIn

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Fluxo Completo Reserva
    Create Session    api    ${BASE_URL}

    # ADMIN
    ${random}=    Generate Random String    5    0123456789
    ${email}=    Set Variable    admin_${random}@email.com

    ${admin_body}=    Create Dictionary
    ...    name=Admin User
    ...    email=${email}
    ...    password=admin123

    POST On Session    api    /api/v1/setup/admin    json=${admin_body}

    ${login_body}=    Create Dictionary
    ...    email=${email}
    ...    password=admin123

    ${login}=    POST On Session    api    /api/v1/auth/login    json=${login_body}

    ${admin_json}=    Set Variable    ${login.json()}
    ${admin_token}=    Set Variable    ${admin_json['data']['token']}

    ${admin_headers}=    Create Dictionary
    ...    Authorization=Bearer ${admin_token}
    ...    Content-Type=application/json

    # CRIAR FILME
    ${genres}=    Create List    Drama

    ${movie}=    Create Dictionary
    ...    title=Filme Reserva
    ...    synopsis=Fluxo completo teste
    ...    director=Diretor Teste
    ...    genres=${genres}
    ...    duration=120
    ...    classification=PG-13
    ...    poster=teste.jpg
    ...    releaseDate=2026-04-08

    ${movie_res}=    POST On Session
    ...    api
    ...    /api/v1/movies
    ...    json=${movie}
    ...    headers=${admin_headers}

    Log    ${movie_res.text}

    Should Be True    ${movie_res.status_code} == 200 or ${movie_res.status_code} == 201

    ${movie_json}=    Set Variable    ${movie_res.json()}
    ${movie_id}=    Set Variable    ${movie_json['data']['_id']}

    # CRIAR TEATRO (FINAL CORRETO)
    ${random_theater}=    Generate Random String    5    0123456789
    ${theater_name}=    Set Variable    Teatro_${random_theater}

    ${theater}=    Create Dictionary
    ...    name=${theater_name}
    ...    capacity=100
    ...    type=standard

    ${theater_json_string}=    Evaluate    json.dumps($theater)    json

    ${theater_res}=    POST On Session
    ...    api
    ...    /api/v1/theaters
    ...    data=${theater_json_string}
    ...    headers=${admin_headers}

    Log    ${theater_res.status_code}
    Log    ${theater_res.text}

    ${theater_json}=    Set Variable    ${theater_res.json()}
    ${theater_id}=    Set Variable    ${theater_json['data']['_id']}

    # CRIAR SESSÃO
    ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2026-04-08T20:00:00.000Z
    ...    fullPrice=30
    ...    halfPrice=15

    ${session_res}=    POST On Session
    ...    api
    ...    /api/v1/sessions
    ...    json=${session}
    ...    headers=${admin_headers}

    Log    ${session_res.text}

    ${session_json}=    Set Variable    ${session_res.json()}
    ${session_id}=    Set Variable    ${session_json['data']['_id']}

    # USER
    ${random_user}=    Generate Random String    5    0123456789
    ${user_email}=    Set Variable    user_${random_user}@email.com

    ${user}=    Create Dictionary
    ...    name=User Teste
    ...    email=${user_email}
    ...    password=12345678

    POST On Session    api    /api/v1/auth/register    json=${user}

    ${user_login}=    Create Dictionary
    ...    email=${user_email}
    ...    password=12345678

    ${user_res}=    POST On Session    api    /api/v1/auth/login    json=${user_login}

    ${user_json}=    Set Variable    ${user_res.json()}
    ${user_token}=    Set Variable    ${user_json['data']['token']}

    ${user_headers}=    Create Dictionary
    ...    Authorization=Bearer ${user_token}
    ...    Content-Type=application/json

    # RESERVA
    ${random_seat}=    Generate Random String    1    123456789
    ${seat_number}=    Convert To Integer    ${random_seat}

    ${seat}=    Create Dictionary
    ...    row=A
    ...    number=${seat_number}
    ...    type=full

    ${seats}=    Create List    ${seat}

    ${reservation}=    Create Dictionary
    ...    session=${session_id}
    ...    seats=${seats}
    ...    paymentMethod=credit_card

    ${reserve_res}=    POST On Session
    ...    api
    ...    /api/v1/reservations
    ...    json=${reservation}
    ...    headers=${user_headers}

    Log    ${reserve_res.text}

    Should Be Equal As Integers    ${reserve_res.status_code}    201

    ${reserve_json}=    Set Variable    ${reserve_res.json()}

    Should Not Be Empty    ${reserve_json}