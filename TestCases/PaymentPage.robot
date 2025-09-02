*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Suite Setup  Open my Browser
Suite Teardown  Close my browser

*** Test Cases ***
TC1_CheckingValidPayment
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    ${status}=    Checking Payment   Visa    12345    05/12
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC2_PaymentWithInvalidCardNumber
    Login   Varun   j2ee
    AddItemToCart   catsimg    cat2    persiancat2
    ${status}=    Checking Payment   MasterCard   ${EMPTY}   05/12
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC3_Invalid_ExpiryFormat
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    ${status}=        Checking Payment   MasterCard  12345   1212/1212
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC4_ShippingToBillingAddress
    Login   Varun   j2ee
    AddItemToCart   dogsimg    dog2    poddledog
    ${status}=        Checking Payment      MasterCard  12345   05/12
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC5_ShippingToDifferentAddress
    Login   Varun   j2ee
    AddItemToCart   reptiles    reptile2    iguana
    ${status}=        Shipping to different address   Upadhyaya   Varun   ATP     2nd road    2nd road    515004    IND
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'