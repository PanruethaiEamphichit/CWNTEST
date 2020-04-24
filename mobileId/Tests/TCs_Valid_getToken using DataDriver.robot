*** Settings ***
Documentation   Suite description
Library         Selenium2Library
Library         DataDriver  file=../TestData/TestData_getToken.csv
Resource        ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot

Test Template       Invalid getToken : Code 500 : Response getToken error

*** Test Cases ***
Send getToken : Code 500 : Using ${username} and ${password}

*** Keywords ***
Invalid getToken : Code 500 : Response getToken error
    [Arguments]    ${username}    ${password}
    Send Request getToken   ${username}     ${password}
    Response getToken Error 500: Wrong username and password