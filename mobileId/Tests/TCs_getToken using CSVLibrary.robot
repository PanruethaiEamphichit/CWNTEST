*** Settings ***
Library                     Collections
Library                     CSVLibrary

*** Test Cases ***
Chaincode API_getToken_Issuer_001
    #@{dict}=    read csv file to associative  ../TestData/TestData_getToken.csv
    #Log  &{dict[0]}[username]  &{dict[0]}[password]
    &{test data}=   get    test-report.csv    ${TEST_NAME}
    LOG Hello ${test data.first_name} ${test data.last_name}