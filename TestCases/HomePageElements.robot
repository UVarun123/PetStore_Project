*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Suite Setup  Open my Browser
Suite Teardown  Close my browser

*** Test Cases ***
TC01_ClickCart
    ${status}=    ValidateHomePageElements     ${HomePageElemets.cart}
    Log to console  ${status}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC02_Clickhelp
    ${status}=             ValidateHomePageElements     ${HomePageElemets.help}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
   ...    ELSE    Log To Console    Link not Opened

TC03_Click_SignIn
    ${status}=             ValidateHomePageElements     ${HomePageElemets.SignIn}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC04_Click_Logo
    ${status}=             ValidateHomePageElements     ${HomePageElemets.logo}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC05_Click_Fishesimg
    ${status}=             ValidateHomePageElements     ${PetElements.fishesimg}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC06_Click_Dogsimg
    ${status}=             ValidateHomePageElements     ${PetElements.dogsimg}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC07_Click_Sidebar_Fish
    ${status}=             ValidateHomePageElements     ${PetElements.fish}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC08_Click_Sidebar_Dog
    ${status}=             ValidateHomePageElements     ${PetElements.dog}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC09_Click_Quicklink_reptiles
    ${status}=             ValidateHomePageElements     ${PetElements.quicklinkreptiles}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened

TC10_Click_Quicklink_cats
    ${status}=             ValidateHomePageElements     ${PetElements.quicklinkcats}
    Run Keyword If    ${status}    Log To Console    Link Opened Successfully
    ...    ELSE    Log To Console    Link not Opened