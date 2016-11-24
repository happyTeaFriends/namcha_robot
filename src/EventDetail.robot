*** Settings ***
Library     Selenium2Library  10
Suite Setup     Open Browser    https://namcha-dev.herokuapp.com/  phantomjs
*** Test Cases ***
Verify all fields disabled
    I want to open Event Detail page
    All fields in the page should be read-only

Verify a facebook post modal popped up
    I want to see "post facebook" modal
    The facebook post modal should be visible

Verify login button should be displyed if it is the first time opened
    I want to see "post facebook" modal
    The login button should be displayed

#Verify message in the modal should contain start and end date if the start date and end date is different
#I want to see "post facebook" modal

#Verify message in the modal should contain only start date if the start date and end date is equal


#Verify if message is posted then the modal should be closed
    #I want to log into facebook app
    #I want to see login button in the modal

#Verify message should be posted if the start date is present or future date

#Verify error modal should not be display if the start date is past date

#Verify the second page can be opened
    #I want to go to next page
    
*** Keywords ***
I want to open Event Detail page
    Go To     https://namcha-dev.herokuapp.com/
    Wait Until Page Contains Element    id=viewBtn1
    Click Button    id=viewBtn1
    #I want to go to next page
    #Click Element   xpath=//li[@class='page-number']/a[contains(text(),'4')]

All fields in the page should be read-only
    Element Should Be Disabled          id=category
    Element Should Be Disabled          id=eventName
    Element Should Be Disabled          id=location
    Element Should Be Disabled          id=description
    Element Should Be Disabled          id=start-date-field
    Element Should Be Disabled          id=end-date-field

I want to see "post facebook" modal
    I want to open Event Detail page
    Click Button    id=facebookModal

The facebook post modal should be visible
    Wait Until Element Is Visible   id=myModal
    Element Should Be Visible   id=myModal

The login button should be displayed
    Wait Until Element Is Visible   id=myModal
    Element Should Be Visible   id=fbLoginBtn







