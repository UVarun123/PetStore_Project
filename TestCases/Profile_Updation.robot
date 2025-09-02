*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC1_Update_Email
    Login   Varun@987       Varun@987
    ${result}=  Profile Updation    ${ProfileUpdation.txt_Email}  Varun123@gmail.com
    Logout
    Run Keyword if  ${result}   Log to console      Email Updated

TC2_Update_FirstName
    Login   Varun@987       Varun@987
    ${result}=  Profile Updation    ${ProfileUpdation.txt_FirstName}     Varun123
    Logout
    Run Keyword if  ${result}   Log to console     First Name Updated