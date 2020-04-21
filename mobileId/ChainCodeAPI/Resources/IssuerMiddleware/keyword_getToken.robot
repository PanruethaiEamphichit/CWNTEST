*** Settings ***
Library     Collections
Library     SeleniumLibrary
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Library     CSVLibrary
Resource    ../../Resources/variables.robot

*** Keywords ***

#Get Json Value and convert to Object
#    [arguments] ${json_string}  ${path}
#    ${value}=    Get Json Value  ${json_string}    ${path}
#    ${value}=    Parse Json  ${value}
#    Return From Keyword    ${value}

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
    #should be equal as strings  ${response.status_code} 200
###Response Code###
    #${status_code}=  convert to string  ${response.status_code}
    should be equal as strings          ${response.status_code}     200

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     access_token
    should contain      ${res_body}     "expires_in":3600
    should contain      ${res_body}     Bearer
    ${AuthToken}=  Collections.Get From Dictionary  ${response.json()}  access_token
    set global variable  ${AuthToken}
    #log to console      ${response.status_code}
    #log to console      ${response.content}
    #log to console  ${response.text}
    #Return From Keyword  ${response}

Response getToken Error 500: Wrong username and password
###Response Code###
    should be equal as strings          ${response.status_code}     500

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     "error": "Wrong username and password"
