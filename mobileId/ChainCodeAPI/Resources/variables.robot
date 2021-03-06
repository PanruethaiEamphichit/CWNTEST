*** Settings ***
Library     DateTime

*** Variables ***

#################################### IssuerMiddleware ####################################

#${URL}                  http://172.16.24.55:3216
${base_url_issuer_mw}   http://172.16.24.55:3216
${network-user}         user1
${File_TestData}        ../TestData/TestData.xlsx


###enroll MobileId###
${url_enrollMobileId}   /enroll-mobileid
${onchainJson_Path}     ../ChainCodeAPI/Resources/OnchainFile/
#${onchainJson_Path}     D:/Parn/Mobile Id/202003_Sprint#9 CCR001-CCR003/Data/onChain/
${mobile_no}            0810090001
${mobile_id_sn}         030810090001
${issuer}               AIS

###update MobileId###
${url_updateMobileId}   /update-mobileid

###get MobileId###
${url_getMobileId}      /get-mobileid

###record Consent Log###
${url_recordConsent}    /record-consent
${cid}                  00000000-0000-0000-0000-030810090001

###get ConsentLog###
${url_getConsent}       /get-consent-log

###list Consent Log By Date###
${url_listConsent}      /list-consent
${created_start_date}   2020-04-16T13:33:00
${today}=    Get Current Date    result_format=%Y%m%d%H%M%S

###revoke Consent Log###
${url_revokeConsent}    /revoke-consent

###invoke Healthcheck###
${url_invokeHealthCheck}    /invoke-healthcheck

###list Healthcheck###
${url_listHealthCheck}      /list-healthcheck



#################################### VerifierMiddleware ####################################

${base_url_verifier_mw}     http://172.16.24.55:3216

###retrieve MobileId###
${url_retrieveMobileId}     /retrieve-mobileid-and-update-consent-log
${verifier}                 AIS
${aal}                      2.2
${tx_type}                  A
${ref1}                     ref1
${ref2}                     ref2

###update verifier result###
${url_updateVerifierResult}     /update-verification-result
@{verified}             Y
${face_score_verified}  0.8
