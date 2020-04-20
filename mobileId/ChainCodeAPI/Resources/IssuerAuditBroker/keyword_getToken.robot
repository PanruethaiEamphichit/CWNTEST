*** Settings ***
Library     Collections
Library     String
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/IssuerAuditBroker/variables.robot

*** Keywords ***

Send Request getToken For IsserAuditBroker
    Create Session  getTokenIsserAuditBrokerSS          ${base_url_IssuerAuditBroker}
    ${body}=        create dictionary   grant_type=${grant_type}  scope=${scope}
    ${header}=      create dictionary   Authorization=${Auth_getToken_IssuerAuditBroker} Content-Type=application/x-www-form-urlencoded
    ${response}=    post request        getTokenIsserAuditBrokerSS  ${url_getToken_IssuerAuditBroker}  data=${body}  headers=${header}
    Set Test Variable                   ${response}

Response getToken For IsserAuditBroker should be Success
###Response Code###
    should be equal as strings          ${response.status_code}     200

###Response Body###
    ${res_body}=  convert to string     ${response.content}
    should contain      ${res_body}     access_token
    should contain      ${res_body}     "expires_in":3600
    should contain      ${res_body}     Bearer
    ${AuthToken}=  Collections.Get From Dictionary  ${response.json()}  access_token
    set global variable  ${authTokenIsserAuditBroker}
    #log to console      ${response.status_code}
    #log to console      ${response.content}
    #log to console  ${response.text}
    #Return From Keyword  ${response}