*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Resource    ../ChainCodeAPI/Keyword_Excel/ExcelLibrary_getToken.robot
Resource    ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot

Suite Setup  Open Excel  TestData_getToken.xlsx     TestData_getToken
Suite Teardown  Close Excel

*** Test Cases ***
Chaincode API_getToken_Issuer_001
    Get Username From Spreadsheet   2   2
    Get Password From Spreadsheet   2   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   2   4
    Response getToken Success   ${status_expected}
    [Teardown]  Publish Test Case Result    13   9    ../TestResult/SIT_CWN_NBT011_Test Case_Mobile ID_Sprint 9 CCR002.xlsx     Functional Testing

Chaincode API_getToken_Issuer_002
    Get Username From Spreadsheet   3   2
    Get Password From Spreadsheet   3   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   3   4
    Response getToken Error 500: Wrong username and password   ${status_expected}

Chaincode API_getToken_Issuer_003
    Get Username From Spreadsheet   4   2
    Get Password From Spreadsheet   4   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   4   4
    Response getToken Error 500: Wrong username and password   ${status_expected}

Chaincode API_getToken_Issuer_004
    Get Username From Spreadsheet   5   2
    Get Password From Spreadsheet   5   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   5   4
    Response getToken Error 500: Wrong username and password   ${status_expected}

Chaincode API_getToken_Issuer_005
    Get Username From Spreadsheet   6   2
    Get Password From Spreadsheet   6   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   6   4
    Response getToken Success   ${status_expected}