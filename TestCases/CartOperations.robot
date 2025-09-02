*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Suite Setup  Open my Browser
Suite Teardown  Close my browser

*** Test Cases ***
TC1_Add_Item_To_Cart
    Login   Varun   j2ee
    ${status}=  AddItemToCart   fish    fish1    angelfish1
    Run Keyword If  ${status}   Log To Console   Item added successfully
    ...    ELSE    Log To Console    'Failed'

TC2_EditItem
    Login   Varun   j2ee
    AddItemToCart   quicklinkdogs    dog1    bulldog1
    EditItem    bulldog1    2
    ${status}=   ValidateItems
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC3_RemoveItem
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    AddItemToCart   quicklinkreptiles    reptile1    rattlesnake1
    ${status}=            RemoveItem
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'