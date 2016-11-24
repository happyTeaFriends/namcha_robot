*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Get to listpage
    Get to EventDetail page


*** Keywords ***
Get to EventDetail page
    Open Browser     https://namcha-dev.herokuapp.com/   phantomjs