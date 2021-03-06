*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***
Send Request listConsentLogByDate For Verifier
    Create Session  listConsentLogByDateVSS          ${base_url_issuer_mw}
    ${body}=        create dictionary   created_start_date=     created_end_date=      used_start_date=      used_end_date=     revoked_start_date=     revoked_end_date=       records=
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        listConsentLogByDateVSS  ${url_listConsent}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response listConsentLogByDate For Verifier should be Success
###Response Code###
    #${status_code}=  convert to string  ${response.status_code}
    should be equal as strings              ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         ${mobile_no}
    should contain      ${res_body}         ${issuer}
    should contain      ${res_body}         ${mobile_id_sn}
    should contain      ${res_body}         ${cid}
    log to console      ${response.content}