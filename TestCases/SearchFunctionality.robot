*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC01_Search_Valid_Name
    ${products}=  Search   Fish
    ${has_products}=    Evaluate    ${products} > 0
    Run Keyword If    ${has_products}       Run Keywords     Log To Console    Products found for Fish: ${products}   AND    Go Back
    ...    ELSE     Run Keywords    Log To Console       No products found for Fish      AND     Go Back

TC02_Search_Invalid_Name
    ${products}=  Search   Car
    ${has_products}=    Evaluate    ${products} > 0
    Run Keyword If    ${has_products}       Run Keywords     Log To Console    Products found for Car: ${products}    AND    Go Back
    ...    ELSE     Run Keywords    Log To Console        No products found for Car      AND     Go Back

TC03_Search_Special_Name
    ${products}=  Search   !@#$%^
    ${has_products}=    Evaluate    ${products} > 0
    Run Keyword If    ${has_products}       Run Keywords     Log To Console    Products found for !@#$%^: ${products}     AND    Go Back
    ...    ELSE     Run Keywords     Log To Console       No products found for !@#$%^    AND     Go Back

TC04_Search_Empty_Name
    ${products}=  Search   ${EMPTY}
    ${has_products}=    Evaluate    ${products} > 0
    Run Keyword If    ${has_products}   Run Keywords     Log To Console    Products found for ${EMPTY}: ${products}   AND    Go Back
    ...    ELSE     Run Keywords     Log To Console     No products found for ${EMPTY}     AND     Go Back