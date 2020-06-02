*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Resource    ../ChainCodeAPI/Keyword_Excel/ExcelLibrary_getToken.robot
Resource    ../Testcase/TCs_getToken_using_ExcelLibrary.robot

Suite Setup  Open Excel  TestData_getToken.xlsx     TestData_getToken
Suite Teardown  Close Excel

*** Test Cases ***
Chaincode API_getToken_Issuer_001

Chaincode API_getToken_Issuer_002

Chaincode API_getToken_Issuer_003

Chaincode API_getToken_Issuer_004

Chaincode API_getToken_Issuer_005