*** Variables ***

#################################### IssuerAuditBroker ####################################

${base_url_IssuerAuditBroker}       http://172.16.24.91

###get Token###
${url_getToken_IssuerAuditBroker}   /issuer/oauth2/connect/token
${authTokenIssuerAuditBroker}  Basic MDAxOnNIY3jldA==
${grant_type}           client_credentials
${scope}                enroll

###receive Enrollment Data###
${url_receiveEnrollmentData}        /issuer/api/enroll/receiveEnrollmentData
${enrollDataJson_Path}     ../ChainCodeAPI/Resources/EnrollDataFile/
#${enrollDataJson_Path}     D:/Parn/Mobile Id/202003_Sprint#9 CCR001-CCR003/Data/onChain/

###retrieve Enrollment Audit Result###
${url_retrieveEnrollmentAuditResult}     /issuer/api/enroll/retrieveEnrollmentAuditResult