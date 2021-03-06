*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***
Send Request recordConsentLog
    Create Session  recordConsentLogSS          ${base_url_issuer_mw}
    ${body}=        create dictionary   mobile_no=${mobile_no}  issuer=${issuer}   mobile_id_sn=${mobile_id_sn}   cid=${cid}
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        recordConsentLogSS  ${url_recordConsent}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response recordConsentLog should be Success
###Response Code###
    #${status_code}=  convert to string  ${response.status_code}
    should be equal as strings              ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    log to console      ${response.content}


Response recordConsentLog Error 412: Existing cid
###Response Code###
    #${status_code}=  convert to string  ${response.status_code}
    should be equal as strings              ${response.status_code}     412
    #log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         Invalid Operation: ConsentLog must not exist in the system (cid: ${cid}, mobile no: ${mobile_no}).