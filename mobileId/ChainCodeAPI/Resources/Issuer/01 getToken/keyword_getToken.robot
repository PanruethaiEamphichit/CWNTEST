*** Settings ***
Library  REST
Library    Collections
Library    String
Library    HttpLibrary.HTTP
Library    RequestsLibrary
Resource  ChainCodeAPI/Resources/variables.robot


*** Keywords ***


Get Json Value and convert to Object
    [arguments] ${json_string}  ${path}
    ${value}=    Get Json Value  ${json_string}    ${path}
    ${value}=    Parse Json  ${value}
    Return From Keyword    ${value}

Response Status should be Success
    [arguments] ${response}
    should be equal as strings  ${response.status_code} 200
    log to console  ${response.status_code}

Response Should Contain Keys
    [arguments] ${object}   ${expected_keys}
    ${object_keys}    Get Dictionary Keys    ${object}
    Sort List   ${object_keys}
    Sort List   ${expected_keys}
    Log List    ${object_keys}
    Log List    ${expected_keys}
    Lists Should Be Equal   ${object_keys}  ${expected_keys}
    log to console  ${response.content}

Send Request getToken
    [arguments]
    Create Session   mobileIdss  ${base_url}
    ${response}=    Get Request  mobileIdss  /token
    Return From Keyword  ${response}