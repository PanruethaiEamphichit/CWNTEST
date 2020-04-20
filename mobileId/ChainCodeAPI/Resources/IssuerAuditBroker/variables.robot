*** Variables ***

#################################### IssuerAuditBroker ####################################

${base_url_IssuerAuditBroker}       http://172.16.24.91

###get Token###
${url_getToken_IssuerAuditBroker}   /issuer/oauth2/connect/token
${Auth_getToken_IssuerAuditBroker}  Basic MDAxOnNIY3jldA==
${grant_type}           client_credentials
${scope}                enroll

###receive Enrollment Data###
${url_receiveEnrollmentData}        /issuer/api/enroll/receiveEnrollmentData

###receive Enrollment Audit Result###
${url_retrieveEnrollmentAuditResult}     /issuer/api/enroll/retrieveEnrollmentAuditResult