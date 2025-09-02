*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Suite Setup  open my browser
Suite Teardown  Close my browser

*** Test Cases ***
TC_01_Verify_Productlink
    ${result}=  ValidateHomePageElements    ${PetElements.fishesimg}
    Run keyword If  ${result}  Log To Console  Successfull
    ...   ELSE  Log To Console   'Failed'

TC_02_Verify_Add_to_cart_button
    ${result}=     AddItemToCart   fish    fish1    angelfish1
    Run keyword If  ${result}  Log To Console  Successfull
    ...   ELSE  Log To Console   'Failed'

TC_03_Verify_cart_Category_listing
    Login   Varun   j2ee
    AddItemToCart   fish    fish2    tigerfish
    ${status}=    Checking Payment      MasterCard  12345   05/12
    Run keyword If  ${status}  Log To Console  Successfull
    ...   ELSE  Log To Console   'Failed'

TC04_Verify_Fish_internal
    ${result}=      Verify Internal Links    ${PetElements.fish}       ${Animals.fish1}      ${TypesOfAnimals.angelfish1}
    Run Keyword If    ${result}    Log To Console    Internal links are working properly
    ...    ELSE    Log To Console    Failed, internal links are not working

TC05_Verify_Dog_internal
    ${result}=      Verify Internal Links    ${PetElements.dog}       ${Animals.dog1}      ${TypesOfAnimals.bulldog1}
    Run Keyword If    ${result}    Log To Console    Internal links are working properly
    ...    ELSE    Log To Console    Failed, internal links are not working

TC06_Verify_Cat_internal
    ${result}=      Verify Internal Links    ${PetElements.cats}       ${Animals.cat1}      ${TypesOfAnimals.manxcat1}
    Run Keyword If    ${result}    Log To Console    Internal links are working properly
    ...    ELSE    Log To Console    Failed, internal links are not working

TC07_Verify_Reptiles_internal
    ${result}=      Verify Internal Links    ${PetElements.reptiles}       ${Animals.reptile1}      ${TypesOfAnimals.rattlesnake1}
    Run Keyword If    ${result}    Log To Console    Internal links are working properly
    ...    ELSE    Log To Console    Failed, internal links are not working

TC08_Verify_Birds_internal
    ${result}=      Verify Internal Links    ${PetElements.birds}       ${Animals.bird1}      ${TypesOfAnimals.amazonparrot}
    Run Keyword If    ${result}    Log To Console    Internal links are working properly
    ...    ELSE    Log To Console    Failed, internal links are not working