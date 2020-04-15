*** Variables ***

#################################### Issuer ####################################

#${URL}                  http://172.16.24.55:3216
${base_url_issuer_mw}   http://172.16.24.55:3216
${network-user}         user1

###get Token###
${url_getToken_issuer_MDW}  /token
${username}             001
${password}             secret

###enroll MobileId###
${url_enrollMobileId}   /enroll-mobileid
${onchainJson_Path}     ../ChainCodeAPI/Resources/OnchainFIle/
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

###list Consent Log ByDate###
${url_listConsent}      /list-consent

###revoke Consent Log###
${url_revokeConsent}    /revoke-consent

###invoke Healthcheck###
${url_invokeHealthCheck}    /invoke-healthcheck

###list Healthcheck###
${url_listHealthCheck}      /list-healthcheck



#################################### Verifier ####################################


###retrieve MobileId###
${url_retrieveMobileId}     /retrieve-mobileid-and-update-consent-log

###update verifier result###
${url_updateVerifierResult}     /update-verification-result