*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***
Send getMobileId
    Create Session  getMobileIdSS          ${base_url_issuer_mw}
    ${body}=        create dictionary   mobile_no=${mobile_no}  mobile_id_sn=${mobile_id_sn}
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        getMobileIdSS  ${url_getMobileId}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response Status getMobileId should be Success
###Response Code###
    #${status_code}=  convert to string  ${response.status_code}
    should be equal as strings  ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         ${mobile_no}
    log to console      ${response.content}