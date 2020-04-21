*** Keywords ***
Valid getToken : Code 200 : Response getToken should be Success
    Send Request getToken

Invalid getToken : Code 500 : Response getToken error