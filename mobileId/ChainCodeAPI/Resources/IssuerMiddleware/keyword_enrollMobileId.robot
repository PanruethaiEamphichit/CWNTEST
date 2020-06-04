*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Library     OperatingSystem
Resource    ../../Resources/variables.robot

*** Keywords ***
Send Request enrollMobileId
    [Arguments]  ${TC_No}
    Create Session  enrollMobileIdSS    ${base_url_issuer_mw}   auth=
    #${body}=       evaluate    json.load(open('mobileId/ChainCodeAPI/Resources/OnchainFile', 'r'))   json
    ${body}=        get binary file     ${onchainJson_Path}${TC_No}.onchain
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        enrollMobileIdSS  ${url_enrollMobileId}  data=${body}   headers=${header}
    Set Test Variable                   ${response}

Response enrollMobileId should be Success
###Response Code###
    should be equal as strings          ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         Operation is successful
    BuiltIn.log to console      ${response.content}
    #log to console  ${response.text}
    #Return From Keyword  ${response}


Response enrollMobileId Error 412: TimeStamp must be in 24hr
###Response Code###
    should be equal as strings          ${response.status_code}     412
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         Invalid Operation: The timestamp field must be in 24hr range (mobile no: ${mobile_no}).
    log to console      ${response.content}


Response enrollMobileId Error 412: Existing MobileId
###Response Code###
    should be equal as strings          ${response.status_code}     412
    #log to console      ${response.status_code}

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     Invalid Operation: The existing MobileId must be terminated. (mobile no: ${mobile_no}, status: A)
    #log to console      ${response.content}