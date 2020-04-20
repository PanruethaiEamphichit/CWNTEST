*** Variables ***

#################################### VerifierAudit ####################################

${base_url_VerifierAudit}   http://172.16.24.91

###request Token###
${url_requestToken_VerifierAudit}   /verifierAuditApi/oauth2/connect/token
${Auth_requestToken_VerifierAudit}  Basic MDAxOnNIY3jldA==
${grant_type}           client_credentials
${scope}                api


###send MobileId For Audit###
${url_sendMobileforAudit}           /verifierAuditApi/api/verifierAuditApi/sendMobileIdforAudit
${start_date}           2020-01-16T03:43:28
${end_date}             2020-01-16T03:43:28

