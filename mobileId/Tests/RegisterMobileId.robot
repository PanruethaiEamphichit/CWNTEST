*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/keyword_getToken.robot

*** Test Cases ***
Register 1 mobileId Successfully
    Send Request getToken
    #Response Status should be Success
