*** Settings ***
Documentation    Suite description
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getToken.robot
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_enrollMobileId.robot
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_recordConsentLog.robot
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getMobileId.robot
Resource  ../ChainCodeAPI/Resources/IssuerMiddleware/keyword_getConsentLog.robot

*** Test Cases ***
E2E_Regist MobileID_001: Register 1 mobileId Error 412: Existing MobileId
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