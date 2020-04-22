*** Settings ***
Documentation   Suite description
Library         SeleniumLibrary
Library         DataDriver  ${TestData_getToken_issuer_Path}${csv_getToken_issuer_Filename}${TestData_getToken_issuer_ext}  sheet_name=${TestData_getToken}
Resource        ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot
Resource        ../ChainCodeAPI/Resources/variables.robot

Test Template       Valid getToken : Code 200 : Response getToken should be Success

*** Test Cases ***
Chaincode API_getToken_Issuer: using ${username} and ${password}

*** Keywords ***
Valid getToken : Code 200 : Response getToken should be Success
    Send Request getToken       ${username}     ${password}
    Response getToken Success

Invalid getToken : Code 500 : Response getToken error
    Send Request getToken
    Response getToken Error 500: Wrong username and password