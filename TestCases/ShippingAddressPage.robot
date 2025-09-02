*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keywords.robot
Suite Setup  Open my Browser
Suite Teardown  Close my browser

*** Test Cases ***
TC1_shippingToValidAddress
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    ${status}=    Checking Payment      MasterCard  12345   05/12
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC2_ValidateCountryField
    Login   Varun   j2ee
    AddItemToCart   fish    fish2    tigerfish
    ${status}=        Shipping to different address   MasterCard  12345   05/12     Upadhyaya   Varun   ATP     2nd road    2nd road    515004    ${EMPTY}
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'

TC3_ValidateZipField
    Login   Varun   j2ee
    AddItemToCart   dog    dog1    bulldog2
    ${status}=        Shipping to different address   MasterCard  12345   05/12    Upadhyaya   Varun   ATP     2nd road    2nd road    ${EMPTY}    IND
    Run Keyword If    ${status}    Log To Console    Successful
    ...    ELSE    Log To Console    'Failed'