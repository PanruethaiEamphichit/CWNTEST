*** Variables ***

${URL}          http://172.16.24.55:3216
${base_url}     http://172.16.24.55:3216


###getToken###
${url_getToken_issuer_MDW}  /token
${username}     001
${password}     secret


###enrollMobileId###
${url_enrollMobileId}   /enroll-mobileid