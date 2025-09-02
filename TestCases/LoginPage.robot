*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC1_Valid_Login
    ${result}=  Login   Varun@987       Varun@987
    Run Keyword If    ${result}   Run Keywords   Log To Console   Login Successful    AND    Logout
    ...    ELSE    Log To Console    Failed

TC2_Invalid_Username
    ${result}=  Login   Car@123456     Car@123
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed

TC3_Invalid_Password
    ${result}=  Login   Car@123    Car@123456
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed

TC4_Blank_Username
    ${result}=  Login   ${EMPTY}     Car@123
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed

TC5_Blank_Password
    ${result}=  Login   Car@123    ${EMPTY}
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed

TC6_Blank_Username_And_Password
    ${result}=  Login   ${EMPTY}    ${EMPTY}
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed

TC7_Invalid_Username_And_Password
    ${result}=  Login   Car@123456     Car@1233489
    Run Keyword If    ${result}     Log To Console    Successful
    ...    ELSE    Log To Console    Login Failed