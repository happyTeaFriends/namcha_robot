*** Settings ***
Library     Selenium2Library
Suite Setup     Open Browser    https://namcha-dev.herokuapp.com/  phantomjs

*** Test Cases ***
Get to listpage
    I want to Upcoming Events from Us page
    #I want to see eventdetail page with all fields being read-only
    #I want to see "post facebook" modal
    #I want to see login button in the modal


    #Get to EventDetail page


*** Keywords ***
I want to Upcoming Events from Us page
    Go To     https://namcha-dev.herokuapp.com/
    Wait Until Page Contains Element    id=viewBtn1
    Click Button    id=viewBtn1


#I want to see eventdetail page with all fields being read-only
    #Click Button    id=facebookModal
#I want to see "post facebook" modal
#I want to see login button in the modal



