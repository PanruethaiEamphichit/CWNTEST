*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Resource    ../ChainCodeAPI/Keyword_Excel/ExcelLibrary_getToken.robot
Resource    ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot
Resource    ../ChainCodeAPI/Resources/IssuerMiddleware/variables.robot
Resource    ../ChainCodeAPI/Resources/variables.robot

Suite Setup     Open Excel  ${File_TestData}     ${File_Sheet_TestData}
Suite Teardown  Close Excel

*** Test Cases ***
Chaincode API_getToken_Issuer_001: Check the Data Structure API
    Get Username From Spreadsheet   6   2
    Get Password From Spreadsheet   2   3
    Send Request getToken       ${username}  ${password}
    Get Response From Spreadsheet   2   4
    Response getToken Success   ${status_expected}
    [Teardown]  Publish Test Case Result    13   9    ${File_Result}     ${File_Sheet_Result}

#Chaincode API_getToken_Issuer_002: Wrong Username
#    Get Username From Spreadsheet   3   2
#    Get Password From Spreadsheet   3   3
#    Send Request getToken       ${username}  ${password}
#    Get Response From Spreadsheet   3   4
#    Response getToken Error 500: Wrong username and password   ${status_expected}
#    [Teardown]  Publish Test Case Result    14   9    ${File_Result}     ${File_Sheet_Result}

#Chaincode API_getToken_Issuer_003: Wrong Password
#    Get Username From Spreadsheet   4   2
#    Get Password From Spreadsheet   4   3
#    Send Request getToken       ${username}  ${password}
#    Get Response From Spreadsheet   4   4
#    Response getToken Error 500: Wrong username and password   ${status_expected}
#    [Teardown]  Publish Test Case Result    15   9    ${File_Result}     ${File_Sheet_Result}

#Chaincode API_getToken_Issuer_004: Username and Password ถูกต้อง
#    Get Username From Spreadsheet   5   2
#    Get Password From Spreadsheet   5   3
#    Send Request getToken       ${username}  ${password}
#    Get Response From Spreadsheet   5   4
#    Response getToken Error 500: Wrong username and password   ${status_expected}
#    [Teardown]  Publish Test Case Result    16   9    ${File_Result}     ${File_Sheet_Result}

#Chaincode API_getToken_Issuer_005: Username and Password ถูกต้อง
#    Get Username From Spreadsheet   6   2
#    Get Password From Spreadsheet   6   3
#    Send Request getToken       ${username}  ${password}
#    Get Response From Spreadsheet   6   4
#    Response getToken Success   ${status_expected}
#    [Teardown]  Publish Test Case Result    17   9    ${File_Result}     ${File_Sheet_Result}