*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Library     Collections

*** Keywords ***

Open Excel
    [Arguments]  ${Filename}    ${Sheet_Name}
    Open Excel Document    ../TestData/${Filename}      doc_id=doc_getToken
    Set Suite Variable  ${Sheet_Name}

Get Username From Spreadsheet
    [Arguments]  ${row_num}    ${col_num}
	${username}=    Read Excel Cell    row_num=${row_num}   col_num=${col_num}  sheet_name=${Sheet_Name}
	Set Test Variable  ${username}
	Log     ${username}

Get Password From Spreadsheet
    [Arguments]  ${row_num}    ${col_num}
	${password}=    Read Excel Cell    row_num=${row_num}   col_num=${col_num}  sheet_name=${Sheet_Name}
	Set Test Variable  ${password}
    Log     ${password}

Get Response From Spreadsheet
    [Arguments]  ${row_num}    ${col_num}
###Response Code###
    ${status_expected}=   Read Excel Cell   row_num=${row_num}   col_num=${col_num}  sheet_name=${Sheet_Name}
    Set Test Variable  ${status_expected}
    log     ${status_expected}
###Response Body###

Publish Test Case Result
    [Arguments]     ${row_num}  ${col_num}  ${File_Result}  ${Sheet_Name_Result}
    Open Excel Document     ${File_Result}  doc_id=doc_getToken_result
    #Write Excel Cell        row_num=${row_num}   col_num=${col_num}  value=${TEST STATUS}     sheet_name=${Sheet_Name_Result}
    ${TestcaseName}         Read Excel Column   col_num=2   sheet_name=${Sheet_Name_Result}
    Run Keyword If          ${TEST_NAME}=='<your_test_name>'
    Save Excel Document     ${File_Result}
    Close Current Excel Document

Close Excel
    Close All Excel Documents