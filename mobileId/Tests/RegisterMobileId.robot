*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_getToken.robot

*** Test Cases ***
Register 1 mobileId Successfully
    Send Request getToken
    #Response Status should be Success
    #Send Request enrollMobileId
    #Send Request recordConsentLog
    #Send getMobileId
    #Send getConsentLog
