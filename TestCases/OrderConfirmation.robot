*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Suite Setup  open my browser
Suite Teardown  Close my browser

*** Test Cases ***
TC01_Order_Confirmation
    Login   Varun   j2ee
    AddItemToCart   fish    fish1    angelfish1
    ${status}=    Checking Payment      MasterCard  12345   05/12
    Run keyword If  ${status}  Log To Console   Successful
    ...   ELSE  Log To Console   'Failed'

TC02_Order_Review
    Login   Varun   j2ee
    AddItemToCart   cats    cat1    manxcat1
   ${status}=  Order_Review     Tide    Abc     Tide    Abc
   Run keyword If  ${status}  Log To Console   Successfull
    ...  ELSE log to console   'Failed'

TC03_Validate_Order_placed
   Login   Varun   j2ee
   ${result}=  Validate Order placed
   AddItemToCart   birds    bird1    amazonparrot
   Checking Payment      MasterCard  12345   05/12
   ${result1}=  Validate Order placed
   ${status}=   Run Keyword And Return Status   Should Be True     ${result1} > ${result}
   Run keyword If  ${status}  Log To Console   Successfull
    ...  ELSE  log to console   ' Failed '