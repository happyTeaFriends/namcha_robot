*** Settings ***
Library     Selenium2Library
Suite Setup		Open Browser       ${URL}    chrome
Suite Teardown	Close Browser
*** Variables ***
${URL}                              https://namcha-dev.herokuapp.com
${BREAKLINE_NUMBER}                 //*[@id="messageModalBody"]/br
${CATEGORY_EMPTY_ERROR}             กรุณากรอก Category
${EVENTNAME_EMPTY_ERROR}            กรุณากรอก Event Name
${LOCATION_EMPTY_ERROR}             กรุณากรอก Location
${STARTDATE_EMPTY_ERROR}            กรุณากรอก Start Date
${ENDDATE_EMPTY_ERROR}              กรุณากรอก End Date
${DESCRIPTION_EMPTY_ERROR}          กรุณากรอก Description
${DATE_RANGE_ERROR}                 Start Date ต้องไม่เกิน End Date
${DESCRIPTION_UNWANTED_CHARS}       Over144Chars
${DESCRIPTION_OVER_144_CHARS}       0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234Over144Chars
&{Training101}                      category=Testing    eventName=BDD 101   location=Geeky Base     startDateInput=11/25/2016 10:50 AM     endDateInput=12/25/2016 12:00 AM     description=This is description
&{INVALID_DATE_RANGE}               startDateInput=11/27/2016 10:50 AM     endDateInput=11/25/2016 12:00 AM

*** Test Cases ***
Validate all required fields
    I want to add more training course
    I should get to the add event list page
    I save the information without entering any information
    The system should not allow me to save the information

Validate category field should not be empty
    I want to add more training course
    I should get to the add event list page
    I fill in all fields without select category dropdown
    I save the information
    The error message is the category is empty

Validate event name field should not be empty
    I want to add more training course
    I should get to the add event list page
    I fill in all fields except the event name field
    I save the information
    The error message is the event name is empty

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

Validate start date field should less than end date
    I want to add more training course
    I fill in all fields with invalid date range
    I save the information
    The error message is the start date must less than end date

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
    Go To		    ${URL}
    Click Link      Add Event
    Wait Until Page Contains Element    id=messageModal     timeout=10 seconds

I should get to the add event list page
    Element Should Contain		//*[@id="page-wrapper"]/div/h2		Add Event List

I fill in all fields except the description field
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=startDateInput   ${Training101.startDateInput}
    Input Text                           id=endDateInput     ${Training101.endDateInput}

I fill in all fields without select category dropdown
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=startDateInput   ${Training101.startDateInput}
    Input Text                           id=endDateInput     ${Training101.endDateInput}
    Input Text                           id=description      ${Training101.description}

I fill in all fields except the event name field
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=startDateInput   ${Training101.startDateInput}
    Input Text                           id=endDateInput     ${Training101.endDateInput}
    Input Text                           id=description      ${Training101.description}

I fill in all fields except the location field
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=startDateInput   ${Training101.startDateInput}
    Input Text                           id=endDateInput     ${Training101.endDateInput}
    Input Text                           id=description      ${Training101.description}

I fill in all fields except the start date field
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=endDateInput     ${Training101.endDateInput}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=description      ${Training101.description}

I fill in all fields except the end date field
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=startDateInput   ${Training101.startDateInput}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=description      ${Training101.description}

I fill in all fields with invalid date range
    Selenium2Library.Select From List    id=category         ${Training101.category}
    Input Text                           id=eventName        ${Training101.eventName}
    Input Text                           id=startDateInput   ${INVALID_DATE_RANGE.startDateInput}
    Input Text                           id=endDateInput     ${INVALID_DATE_RANGE.endDateInput}
    Input Text                           id=location         ${Training101.location}
    Input Text                           id=description      ${Training101.description}

I save the information
    Wait Until Element is Visible       id=description
    Click Button                        id=saveButton

I save the information without entering any information
    Wait Until Element is Visible       id=description
    Click Button                        id=saveButton

The system should not allow me to save the information
    Wait Until Element is Visible       id=messageModal
    Element Should Be Visible           id=messageModal
    Click Button                        OK

The system should not allow me to save the information because the description is empty
    Wait Until Element is Visible       id=messageModal
    Element Should Be Visible           id=messageModal
    Element Should Contain              id=messageModalBody         ${DESCRIPTION_EMPTY_ERROR}
    Xpath Should Match X Times          ${BREAKLINE_NUMBER}         0

The error message is the category is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody         ${CATEGORY_EMPTY_ERROR}

The error message is the event name is empty
     Wait Until Element Is Visible      id=messageModal
     Element Should Contain             id=messageModalBody         ${EVENTNAME_EMPTY_ERROR}

The error message is the location is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody         ${LOCATION_EMPTY_ERROR}

The error message is the start date is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody         ${STARTDATE_EMPTY_ERROR}

The error message is the end date is empty
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody         ${ENDDATE_EMPTY_ERROR}

I try to add a very long description which exceeds the maximum length
    Input Text                           id=description             ${DESCRIPTION_OVER_144_CHARS}

The system should not allow me to enter the description more than the maximum length
    Element Should Not Contain           id=description             ${DESCRIPTION_UNWANTED_CHARS}

The error message is the start date must less than end date
    Wait Until Element Is Visible       id=messageModal
    Element Should Contain              id=messageModalBody         ${DATE_RANGE_ERROR}
