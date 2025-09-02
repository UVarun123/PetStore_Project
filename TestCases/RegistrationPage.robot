*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC01_Register_Valid_Details
    ${result}=  Register        Chandu@004      Chandu@123      Chandu@123  Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed

TC02_Register_Blank_UserId
    ${result}=  Register        ${EMPTY}      Chandu@123      Chandu@123  Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed

TC03_Register_Blank_Password
    ${result}=  Register        Chandu@001      ${EMPTY}      Chandu@123  Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed

TC04_Register_Blank_RepeatPassword
    ${result}=  Register        Chandu@001      Chandu@123      ${EMPTY}  Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed

TC05_Register_Blank_Username_And_Password
    ${result}=  Register            ${EMPTY}      ${EMPTY}      Chandu@123   Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console       Registration Successfull
    ...    ELSE   Log To Console     Registration Failed

TC06_Register_Blank_Email
    ${result}=  Register        Chandu@001      Chandu@123      Chandu@123  Chandu  Varun   ${EMPTY}   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed

TC07_Register_Duplicate_Username
    ${result}=  Register        Chandu@001      Chandu@123      Chandu@123  Chandu  Varun   Chanduvarun@gmail.com   9876543210  H.NO:143    Blue Moon   Bangalore   Karnataka   500010  India
    Run Keyword If    ${result}     Log To Console    Registration Successfull
    ...    ELSE    Log To Console    Registration Failed