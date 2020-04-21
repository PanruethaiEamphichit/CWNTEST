*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***
Send Request retrieveMobileId
    Create Session  retrieveMobileIdSS          ${base_url_verifier_mw}
    ${body}=        create dictionary   mobile_no=${mobile_no}  issuer=${issuer}   mobile_id_sn=${mobile_id_sn}   cid=${cid}    verifier=${verifier}    aal=${aal}  tx_type=${tx_type}  ref1=${ref1}    ref2=${ref2}
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json
    ${response}=    post request        retrieveMobileIdSS  ${url_retrieveMobileId}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response retrieveMobileId should be Success
###Response Code###
    should be equal as strings              ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    log to console      ${response.content}