*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot
Resource    ../../Resources/IssuerAuditBroker/variables.robot

*** Keywords ***
Send Request retrieveEnrollmentAuditResult
    Create Session  retrieveEnrollmentAuditResultSS          ${base_url_IssuerAuditBroker}
    ${body}=        create dictionary   refno=${refNo}  issuer=${issuer}
    ${header}=      create dictionary   Content-Type=application/json   Authorization=Bearer ${authTokenIssuerAuditBroker}
    ${response}=    post request        retrieveEnrollmentAuditResultSS  ${url_retrieveEnrollmentAuditResult}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response retrieveEnrollmentAuditResult should be Success
###Response Code###
    should be equal as strings              ${response.status_code}     200
    log to console      ${response.status_code}

###Response Body###
    log to console      ${response.content}