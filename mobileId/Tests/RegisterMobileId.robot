*** Settings ***
Documentation    Suite description
Resource  ChainCodeAPI/Resources/Issuer/01 getToken/keyword_getToken.robot

*** Test Cases ***
Register 1 mobileId Successfully
    Send Request getToken
    Response Status should be Success  200
    log to console  ${response.content}