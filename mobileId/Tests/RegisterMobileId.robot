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
    Response getToken should be Success
    Send Request enrollMobileId                                 E2E_Regist MobileID_001
    Response enrollMobileId Error 412: Existing MobileId
    Send Request recordConsentLog
    Response recordConsentLog Error 412: Existing cid
    Send getMobileId
    Response getMobileId should be Success
    Send getConsentLog
    Response getConsentLog should be Success
