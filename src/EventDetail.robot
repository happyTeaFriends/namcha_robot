*** Settings ***
Library     Selenium2Library  25
Suite Setup     Go To Namcha App with Facebook logged in
Suite Teardown	Close Browser
*** Variables ***
${count}     Get Matching Xpath Count    /html/body/div[2]/div[1]/div[2]/div[4]/div[2]/ul/li

*** Test Cases ***
Verify all fields disabled
    I want to open Event Detail page
    All fields in the page should be read-only

Verify a facebook post modal popped up
    I want to open Event Detail page
    I want to see "post facebook" modal
    The facebook post modal should be visible

Verify the second page can be opened
    I want to open the main page
    I click on '2' button at the left-bottom of the main page
    The second page should be opened

Verify if message is posted then the modal should be closed
     I want to open Event Detail page
     I want to see "post facebook" modal
     I click post button on the modal
     The "post facebook" modal shold be closed
Verify error modal should not be display if the start date is past date
      I want to open the main page
      I create a past event
      I want to see "post facebook" modal


*** Keywords ***
Go To Namcha App with FAcebook logged in
    Open Browser                https://th-th.facebook.com/         phantomjs
    Input Text                  id=email                            happyteafriendsja@gmail.com
    Input Password              id=pass                             qwerty159632478
    Click Button                เข้าสู่ระบบ

I want to open the main page
    Go To                   https://namcha-dev.herokuapp.com
    Wait Until Page Contains Element                            id=viewBtn1

I want to open Event Detail page
    I want to open the main page
    Click Element   xpath=/html/body/div[2]/div[1]/div[2]/div[4]/div[2]/ul/li[last()-1]/a
    Wait Until Page Contains Element                            id=viewBtn61
    Click Element                                               id=viewBtn61

All fields in the page should be read-only
    Element Should Be Disabled                                  id=category
    Element Should Be Disabled                                  id=eventName
    Element Should Be Disabled                                  id=location
    Element Should Be Disabled                                  id=description
    Element Should Be Disabled                                  id=start-date-field
    Element Should Be Disabled                                  id=end-date-field

I want to see "post facebook" modal
    Click Button                                id=facebookModal

The facebook post modal should be visible
    Wait Until Element Is Visible               id=myModal
    Element Should Be Visible                   id=myModal

I click post button on the modal
    Wait Until Element Is Visible               id=myModal
    Click Button                                id=postBtn

The "post facebook" modal shold be closed
    Wait Until Element Is Not Visible           id=myModal
    Element Should Not Be Visible               id=myModal

I click on '2' button at the left-bottom of the main page
    Click Element   xpath=/html/body/div[2]/div[1]/div[2]/div[4]/div[2]/ul/li[3]/a

The second page should be opened
    Wait Until Page Contains Element            id=viewBtn11
    Page Should Contain Element	                id=viewBtn11

I create a past event
    Click Button                             id=addBtn
    Selenium2Library.Select From List        id=category         Testing
    Input Text                               id=eventName        BDD 101
    Input Text                               id=location         Geeky Base
    Input Text                               id=startDateInput   startDateInput=11/22/2015 13:50 AM
    Input Text                               id=endDateInput     endDateInput=11/26/2016 12:00 AM
    Input Text                               id=description      น้ำชาได้ทำการส่ง code ให้ทาง email สำหรับทุกท่านแล้วค่ะ
    Wait Until Element is Visible            id=description
    Click Button                             id=saveButton       บันทึก
I want to open the first event of the main page
    Wait Until Page Contains Element            id=viewBtn1
    Click Element                               id=viewBtn1