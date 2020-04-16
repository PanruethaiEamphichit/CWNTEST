*** Settings ***
Documentation    Suite description
Resource    ../ChainCodeAPI/Resources/VerifierMiddleware/keyword_updateVerifierResult.robot

*** Test Cases ***
Update Verifier Result Should Be Success
    Send Request updateVerifierResult
    Response recordConsentLog should be Success