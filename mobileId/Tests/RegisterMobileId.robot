*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_getToken.robot
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_enrollMobileId.robot

*** Test Cases ***
E2E_Regist MobileID_001: Register 1 mobileId Successfully
    Send Request getToken
    Response Status should be Success
    Send Request enrollMobileId     E2E_Regist MobileID_001
    #Send Request recordConsentLog
    #Send getMobileId
    #Send getConsentLog
