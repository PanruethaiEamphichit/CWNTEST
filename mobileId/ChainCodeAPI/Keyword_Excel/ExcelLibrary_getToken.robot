*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary
Library     Collections
#Resource    ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot

*** Keywords ***

Open Excel
    [Arguments]  ${Filename}    ${Sheet_Name}
    Open Excel Document    ../TestData/${Filename}      doc_id=doc_getToken
    Set Suite Variable  ${Sheet_Name}

Get Data from Column Name



Get Username From Spreadsheet
    [Arguments]  ${row_num}    ${col_num}
	${username}=    Read Excel Cell    row_num=${row_num}   col_num=${col_num}  sheet_name=${Sheet_Name}
	${TestcaseName}=    Read Excel Column   ${col_num}   sheet_name=${Sheet_Name_Result}
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
###Test Result - PASS/FAIL###
    [Arguments]     ${iTotalRows}  ${col_num}  ${File_Result}  ${Sheet_Name_Result}
    Open Excel Document     ${File_Result}  doc_id=doc_getToken_result
    Write Excel Cell        row_num=${row_num}   col_num=${col_num}  value=${TEST STATUS}     sheet_name=${Sheet_Name_Result}

    #:FOR    {iTotalRows}    IN    ${Sheet_Name_Result}
    #Get the total rows in the Sheet
    #    :FOR    ${iRowNo}       IN RANGE    1    ${iTotalRows}+1
    #    ${TC_Num}           Read Excel Cell     ${iRowNo}   0   ${Sheet_Name_Result}
    #Incase TestCase No is same , fetch the data from same row and given column No
    #    ${sSearchedData}    Run Keyword If    "${TestcaseName}"=="${TC_Num}"    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${colNum}
    #    ...    ${iRowNo}
    #    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Exit For Loop
    #[Return]    ${sSearchedData}
    log to console          Allrow=${iTotalRows}
    #Run Keyword If          ${TEST_NAME}=='<your_test_name>'
###Request Data###
    ${request_col_num}=     Evaluate    ${col_num}-${3}
    ${request_result}=      set variable    ${URL_POST} \n ${header} \n ${body}
    Run Keyword If          '${TEST STATUS}'=='PASS'    Write Excel Cell    ${row_num}   ${request_col_num}     ${request_result}
###Actual Result###
    ${actual_col_num}=      Evaluate    ${col_num}-${1}
    ${actual_result}=       set variable    Status code: ${status_code} \n message: ${res_body}
    Run Keyword If          '${TEST STATUS}'=='PASS'    Write Excel Cell    ${row_num}   ${actual_col_num}      ${actual_result}

    Save Excel Document     ${File_Result}
    Close Current Excel Document

Close Excel
    Close All Excel Documents