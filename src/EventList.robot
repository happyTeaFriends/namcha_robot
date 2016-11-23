*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Get to Eventlist
    Get to Eventlist


*** Keywords ***
Get to Eventlist
    Open Browser    http://localhost:8080   chrome
    Click Link   เพิ่ม

