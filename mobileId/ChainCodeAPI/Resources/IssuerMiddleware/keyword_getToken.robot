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
Send Request getToken
    [Arguments]     ${username}         ${password}
    Create Session  getTokenSS          ${base_url_issuer_mw}
    ${body}=        create dictionary   username=${username}  password=${password}
    ${header}=      create dictionary   Content-Type=application/json
    ${response}=    post request        getTokenSS  ${url_getToken_issuer_MW}  data=${body}  headers=${header}
    Set Test Variable   ${response}
    ${URL_POST}=    set variable        POST ${url_getToken_issuer_MW} Host: ${base_url_issuer_mw}
    Set Test Variable   ${URL_POST}
    Set Test Variable   ${header}
    Set Test Variable   ${body}

Response getToken Success
    [Arguments]  ${status_expected}
###Response Code###
    #should be equal as strings          ${response.status_code}     200
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal     ${status_code}      ${status_expected}
    Set Test Variable   ${status_code}
    log to console      ${status_code}

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     access_token
    should contain      ${res_body}     Bearer
    ${expire_in_response}=     Collections.Get From Dictionary      ${response.json()}  expires_in
    should be equal as integers         ${expire_in_response}       ${expire_in_value}
    ${AuthToken}=           Collections.Get From Dictionary         ${response.json()}  access_token
    Set Test variable   ${AuthToken}
    Set Test Variable   ${res_body}
    log to console      ${res_body}
    #log to console  ${response.text}

Response getToken Error 500: Wrong username and password
    [Arguments]  ${status_expected}
###Response Code###
    #should be equal as strings             ${response.status_code}     500
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal     ${status_code}      ${status_expected}
    Set Test Variable   ${status_code}
    log to console      ${response.status_code}

###Response Body###
    ${res_body}=    convert to string       ${response.content}
    ${error_msg}=   Collections.Get From Dictionary     ${response.json()}     error
    should be equal     ${error_msg}         Wrong username and password
    Set Test Variable   ${res_body}
    log to console      ${res_body}
