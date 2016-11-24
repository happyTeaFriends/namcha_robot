*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Get to Eventlist
    Get to Eventlist
    Get to Add Event List

*** Keywords ***
Get to Eventlist
            Open Browser                     https://namcha-dev.herokuapp.com/   phantomjs
            Click Link                              เพิ่ม

Get to Add Event List
            Selenium2Library.Select From List    id=category         Testing
            Input Text                           id=eventName        BDD 101
            Input Text                           id=location         Geeky Base
            Input Text                           id=description      น้ำชา ตับไตไส้พุง

