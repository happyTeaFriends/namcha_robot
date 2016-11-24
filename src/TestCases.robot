*** Settings ***
Library  Selenium2Library

*** Test Cases ***
Login Facebook with invalid user password
    Get to facebook login page
    Try to login with invalid user password
    Should not be able to login and show error messages

*** keywords ***
Get to facebook login page
    Open Browser    http://www.facebook.com/   phantomjs
    Wait Until Page Contains  ยินดีต้อนรับสู่ Facebook

Try to login with invalid user password
    Input Text  id=email      xxx@gmail.com
    Input Password  id=pass      xxx
    Click Button    เข้าสู่ระบบ

Should not be able to login and show error messages
    Focus    email
    Page should contain    อีเมลที่คุณป้อนไม่ตรงกับบัญชีผู้ใช้ใดๆ
