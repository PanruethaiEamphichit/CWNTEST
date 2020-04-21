*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot

*** Keywords ***
Valid getToken : Code 200 : Response getToken should be Success
    Send Request getToken       ${username}     ${password}
    Response getToken Success

Invalid getToken : Code 500 : Response getToken error
    Send Request getToken
    Response getToken Error 500: Wrong username and password

Test Template       Valid getToken : Code 200 : Response getToken should be Success

*** Test Cases ***
Chaincode API_getToken_Issuer: using ${username} and ${password}

