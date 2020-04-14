*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_getToken.robot
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_enrollMobileId.robot
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_recordConsentLog.robot
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_getMobileId.robot
Resource  ../ChainCodeAPI/Resources/Issuer/keyword_getConsentLog.robot

*** Test Cases ***
E2E_Regist MobileID_001: Register 1 mobileId Successfully
    Send Request getToken
    Response Status getToken should be Success
    Send Request enrollMobileId     E2E_Regist MobileID_001
    Response Status enrollMobileId should be Success
    Send Request recordConsentLog
    Response Status recordConsentLog should be Success
    Send getMobileId
    Response Status getMobileId should be Success
    Send getConsentLog
    Response Status getConsentLog should be Success
