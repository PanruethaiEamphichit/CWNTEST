*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Resource    ../ChainCodeAPI/Keyword_Excel/ExcelLibrary_getToken.robot
Resource    ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot


*** Test Cases ***
Chaincode API_getToken_Issuer_001
    Get Values and Modify Spreadsheet
    Send Request getToken   ${username}  ${password}
