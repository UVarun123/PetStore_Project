*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC1_Profile_Page
    Login   Varun@987   Varun@987
    ${result}   ${result2}=   Session Handling    ${SessionHandling.myAccount}      ${SessionHandling.Click_myOrders}
    Set Suite Variable    ${result2}
    Logout
    ${res}=     Read Page Objects    ${result}
    Run Keyword if  ${res}  Log to console      Profile Page can be viewed after login

TC2_Order_History
    Log to console      ${result2}
    ${res}=     Read Page Objects    ${result2}
    Run Keyword if  ${res}  Log to console      Order History Can be viewed after login