*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary

*** Keywords ***

Open Excel
    open excel document    ../TestData/TestData_getToken.xlsx

Get Values and Modify Spreadsheet
	${username}=    read excel column    col_num=2  max_num=1   sheet_name=TestData_getToken
	${password}=    read excel column    col_num=3  max_num=1   sheet_name=TestData_getToken
	Set Suite Variable    ${username}
    Set Suite Variable    ${password}