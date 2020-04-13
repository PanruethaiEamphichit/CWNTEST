*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     HttpLibrary.HTTP
Resource    ../../Resources/variables.robot

*** Keywords ***

Send Request enrollMobileId
    Create Session   enrollMobileIdSS  ${base_url}
    ${body}=  create dictionary  username=${username}  password=${password}
    ${header}=  create dictionary  network-user=${username} Content-Type=application/json Authorization=Bearer${AuthToken}
    ${response}=  post request  enrollMobileIdSS  ${url_enrollMobileId}  data=${body}  headers=${header}

###Response Code###
    #should be equal as strings  ${response.status_code}     200

###Response Body###
    #${res_body}=    convert to string  ${response.content}
    #should contain  ${res_body}     Operation is successful
    log to console  ${response.status_code}
    log to console  ${response.content}
    #log to console  ${response.text}
    #Return From Keyword  ${response}