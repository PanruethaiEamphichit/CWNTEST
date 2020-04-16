*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***
Send Request getConsentLog for Verifier
    Create Session  getConsentLogVSS          ${base_url_verifier_mw}
    ${body}=        create dictionary   mobile_no=${mobile_no}  issuer=${issuer}   mobile_id_sn=${mobile_id_sn}   cid=${cid}
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        getConsentLogVSS  ${url_getConsent}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response getConsentLog should be Success
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