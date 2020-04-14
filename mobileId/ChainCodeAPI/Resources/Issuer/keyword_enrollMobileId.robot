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
    Create Session  enrollMobileIdSS   ${base_url_issuer_mw}
    #${body}=       evaluate    json.load(open('mobileId/ChainCodeAPI/Resources/OnchainFile', 'r'))   json
    ${body}=        get binary file     ${onchainJson_Path}${TC_No}.onchain
    ${header}=      create dictionary   network-user=${network-user}    Content-Type=application/json   Authorization=Bearer ${AuthToken}
    ${response}=    post request        enrollMobileIdSS  ${url_enrollMobileId}  data=${body}   headers=${header}

Response Status enrollMobileId should be Success
###Response Code###
    #should be equal as strings  ${response.status_code}     200
    should be equal as strings  ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    #${res_body}=   convert to string  ${response.content}
    #should contain ${res_body}     Operation is successful
    log to console  ${response.content}
    #log to console  ${response.text}
    #Return From Keyword  ${response}