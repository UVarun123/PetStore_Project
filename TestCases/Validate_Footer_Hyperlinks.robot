*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  Open my browser
Suite Teardown      Close my browser

*** Test Cases ***
TC01_CTA_Link
    ${result}=  Validate_Footer_Link   ${FooterLinks.footer1}
    Log to console  ${result}
    Run Keyword If    ${result}     Run Keywords      Log To Console    CTA link opened successfully     AND    Go Back
    ...    ELSE     Run Keywords    Log To Console    CTA link failed to open       AND    Go Back

TC02_Footer_Link1
    ${result}=  Validate_Footer_Link  ${FooterLinks.hostedlink}
    Run Keyword If    ${result}     Run Keywords     Log To Console    hosted link opened successfully    AND    Switch Window     title=JPetStore Demo
    ...    ELSE     Log To Console    hosted link failed to open

TC03Footer_Link2
    ${result}=  Validate_Footer_Link   ${FooterLinks.poweredlink}
    Run Keyword If    ${result}     Run Keywords    Log To Console    powered link opened successfully      AND    Switch Window     title=JPetStore Demo
    ...    ELSE     Log To Console   powered link failed to open