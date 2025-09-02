*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Suite Setup  Open my Browser
Suite Teardown  Close my browser

*** Test Cases ***
TC1_AddSameProductMultipleTimes
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    Go to   ${url}
    ${total}=          AddItemToCart   fish    fish1    angelfish1
    Run Keyword If    ${total}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC2_AddDifferentProducts
    Login   Varun   j2ee
    AddItemToCart   quicklinkdogs    dog6    chihudog2
    Go to   ${url}
    ${total}=          AddItemToCart   fish    fish1    angelfish1
    Run Keyword If    ${total}    Log To Console    Successful
    ...    ELSE    Log To Console    Failed

TC3_EnterInvalidQuantity
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    EditItem    angelfish1    0
    ${status}=   ValidateItems
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'