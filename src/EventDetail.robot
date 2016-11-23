*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Get to listpage
    Get to EventDetail page
    Click Button Postfacebook
    Try to connect DataBase error
    Should not be able to listpage and show error modal messages

*** Keywords ***
Get to EventDetail page
    Open Browser    http://localhost:8080/index.html   chrome