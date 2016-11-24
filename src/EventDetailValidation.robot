*** Settings ***
Library     Selenium2Library
Suite Setup		Open Browser       https://namcha-dev.herokuapp.com   phantomjs
Suite Teardown	Close Browser

*** Test Cases ***
Validate all required fields
    I want to add more training course
    I should get to the add event list page
    I save the information
    The system should not allow me to save the information

Validate category field should not be empty
    I want to add more training course
    I should get to the add event list page
    I fill in all fields without select category dropdown
    I save the information
    The error message is the category is empty

Validate start date field should not be empty
    I want to add more training course
    I fill in all fields except the start date field
    I save the information
    The error message is the start date is empty

Validate end date field should not be empty
    I want to add more training course
    I fill in all fields except the end date field
    I save the information
    The error message is the end date is empty

Validate location field should not be empty
    I want to add more training course
    I fill in all fields except the location field
    I save the information
    The error message is the location is empty

Validate description field should not be empty
    I want to add more training course
    I should get to the add event list page
    I fill in all fields except the description field
    I save the information
    The system should not allow me to save the information because the description is empty

Validate description field should not exceed the maximum length
    I want to add more training course
    I should get to the add event list page
    I fill in all fields except the description field
    I try to add a very long description which exceeds the maximum length
    The system should not allow me to enter the description more than the maximum length

*** Keywords ***
I want to add more training course
    Go To		    https://namcha-dev.herokuapp.com
    Click Link      Add Event
    Wait Until Page Contains Element    id=messageModal     timeout=10 seconds

I should get to the add event list page
    Element Should Contain		//*[@id="page-wrapper"]/div/h2		Add Event List

I fill in all fields except the description field
    Selenium2Library.Select From List    id=category         Testing
    Input Text                           id=eventName        BDD 101
    Input Text                           id=location         Geeky Base
    Input Text                           id=startDateInput   11/25/2016 10:50 AM
    Input Text                           id=endDateInput     12/25/2016 12:00 AM

I fill in all fields without select category dropdown
    Input Text                           id=eventName        BDD 101
    Input Text                           id=location         Geeky Base
    Input Text                           id=startDateInput   11/25/2016 10:50 AM
    Input Text                           id=endDateInput     12/25/2016 12:00 AM
    Input Text                           id=description      This is Description.

I fill in all fields except the location field
    Selenium2Library.Select From List    id=category         Testing
    Input Text                           id=eventName        BDD 101
    Input Text                           id=startDateInput   11/25/2016 10:50 AM
    Input Text                           id=endDateInput     12/25/2016 12:00 AM
    Input Text                           id=description      This is Description.

I fill in all fields except the start date field
    Selenium2Library.Select From List    id=category         Testing
    Input Text                           id=eventName        BDD 101
    Input Text                           id=endDateInput     12/25/2016 12:00 AM
    Input Text                           id=location         Geeky Base
    Input Text                           id=description      This is Description.

I fill in all fields except the end date field
    Selenium2Library.Select From List    id=category         Testing
    Input Text                           id=eventName        BDD 101
    Input Text                           id=startDateInput     12/25/2016 12:00 AM
    Input Text                           id=location         Geeky Base
    Input Text                           id=description      This is Description.

I save the information
    Wait Until Element is Visible       id=description
    Click Button                        id=saveButton

The system should not allow me to save the information
    Wait Until Element is Visible       id=messageModal
    Element Should Be Visible           id=messageModal
    Click Button                        OK

The system should not allow me to save the information because the description is empty
    Wait Until Element is Visible       id=messageModal
    Element Should Be Visible           id=messageModal
    Element Should Contain              id=messageModalBody             กรุณากรอก description
#            Xpath Should Match X Times          //*[@id="messageModalBody"]/br  0

The error message is the category is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody     กรุณากรอก category

The error message is the location is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody     กรุณากรอก location

The error message is the start date is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody     กรุณากรอก startDate

The error message is the end date is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody     กรุณากรอก endDate

I try to add a very long description which exceeds the maximum length
    Input Text                           id=description                 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234Over144Chars

The system should not allow me to enter the description more than the maximum length
    Element Should Not Contain           id=description                 Over144Chars