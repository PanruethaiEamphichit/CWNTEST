*** Settings ***
Library     Collections
Library     Selenium2Library
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
#Library     CSVLib
Resource    ../../Resources/IssuerMiddleware/variables.robot

*** Keywords ***

#Response Should Contain Keys
#    [arguments] ${object}   ${expected_keys}
#    ${object_keys}    Get Dictionary Keys    ${object}
#    Sort List   ${object_keys}
#    Sort List   ${expected_keys}
#    Log List    ${object_keys}
#    Log List    ${expected_keys}
#    Lists Should Be Equal   ${object_keys}  ${expected_keys}
#    log to console  ${response.content}

Send Request getToken
    [Arguments]     ${username}         ${password}
    Create Session  getTokenSS          ${base_url_issuer_mw}
    ${body}=        create dictionary   username=${username}  password=${password}
    ${header}=      create dictionary   Content-Type=application/json
    ${response}=    post request        getTokenSS  ${url_getToken_issuer_MW}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response getToken Success
    [Arguments]  ${status_expected}
###Response Code###
    #should be equal as strings          ${response.status_code}     200
    ${status_code}=     convert to string  ${response.status_code}
    Should Be Equal     ${status_code}  ${status_expected}
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     access_token
    should contain      ${res_body}     Bearer
    ${expire_in_value}=     Collections.Get From Dictionary     ${response.json()}  expires_in
    should be equal as integers         ${expire_in_value}      3600
    ${AuthToken}=           Collections.Get From Dictionary     ${response.json()}  access_token
    set global variable  ${AuthToken}
    log to console      ${response.content}
    #log to console  ${response.text}

Response getToken Error 500: Wrong username and password
    [Arguments]  ${status_expected}
###Response Code###
    #should be equal as strings             ${response.status_code}     500
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal     ${status_code}      ${status_expected}
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=    convert to string       ${response.content}
    ${error_msg}=   Collections.Get From Dictionary     ${response.json()}     error
    should be equal     ${error_msg}         Wrong username and password
    log to console      ${response.content}
