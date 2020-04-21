*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Library     OperatingSystem
Resource    ../../Resources/variables.robot
Resource    ../../Resources/IssuerAuditBroker/variables.robot

*** Keywords ***

Send Request receiveEnrollmentData
    [Arguments]  ${TC_No}
    Create Session  receiveEnrollmentDataSS    ${base_url_IssuerAuditBroker}
    #${body}=       evaluate    json.load(open('mobileId/ChainCodeAPI/Resources/OnchainFile', 'r'))   json
    ${body}=        get binary file     ${enrollDataJson_Path}${TC_No}.txt
    ${header}=      create dictionary   Content-Type=application/json   Authorization=Bearer ${authTokenIssuerAuditBroker}
    ${response}=    post request        receiveEnrollmentDataSS  ${url_receiveEnrollmentData}  data=${body}   headers=${header}
    Set Test Variable                   ${response}

Response receiveEnrollmentData should be Success
###Response Code###
    should be equal as strings          ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=        convert to string   ${response.content}
    should contain      ${res_body}         Operation runs successfully
    ${refNo}=  Get Json Value    ${response.json()}     /result/refno
    set global variable  ${refNo}
    log to console      ${response.content}