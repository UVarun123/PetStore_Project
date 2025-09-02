*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Library    ../Resources/YamlLibrary.py
Variables  ../PageObjects/Locators.yaml

*** Variables ***
${url}  https://petstore.octoperf.com/actions/Catalog.action
${registerpageurl}  https://petstore.octoperf.com/actions/Account.action?newAccountForm=
${browser}  chrome

*** Keywords ***
Open my Browser
    open browser        ${url}     ${browser}
    maximize browser window




Close my browser
    close all browsers

Login
    [Arguments]     ${username}     ${password}
    click link    ${LoginPage.SignIn}
    Input text  ${LoginPage.txt_loginUserName}    ${username}
    Input text  ${LoginPage.txt_loginPassword}     ${password}
    click button    ${LoginPage.btn_signIn}
    ${login_status}=    Run Keyword and return Status   Page should contain     Welcome
    [Return]  ${login_status}

Logout
    click link      ${LoginPage.signout}

Register
    [Arguments]     ${UserId}   ${NewPassword}  ${RepeatPassword}   ${firstname}    ${lastname}     ${email}    ${Phone}    ${Address1}      ${Address2}     ${city}     ${State}    ${Zip}      ${Country}
    Set Selenium Speed    1seconds
    click link      ${LoginPage.SignIn}
    click link      ${Registration.register_now}
    Input text      ${Registration.txt_UserId}    ${UserId}
    Input text      ${Registration.txt_NewPassword}  ${NewPassword}
    Input text      ${Registration.txt_RepeatPassword}  ${RepeatPassword}
    Input text      ${Registration.txt_FirstName}  ${firstname}
    Input text      ${Registration.txt_LastName}  ${lastname}
    Input text      ${Registration.txt_Email}  ${email}
    Input text      ${Registration.txt_Phone}  ${Phone}
    Input text      ${Registration.txt_Address1}  ${Address1}
    Input text      ${Registration.txt_Address2}  ${Address2}
    Input text      ${Registration.txt_City}  ${city}
    Input text      ${Registration.txt_State}  ${State}
    Input text      ${Registration.txt_Zip}  ${Zip}
    Input text      ${Registration.txt_Country}   ${Country}
    Click button    ${Registration.txt_SaveInfo}
    ${register_status}=   Run Keyword and return Status   Location should be    ${url}
    go to    ${url}
    [Return]     ${register_status}

Profile Updation
    [Arguments]     ${Field}     ${Value}
    Click Link      ${ProfileUpdation.myAccount}
    Input text      ${Field}     ${Value}
    click button    ${ProfileUpdation.txt_myAccountInfo}
    [Return]    True

Search
    [Arguments]    ${product}
    set selenium speed      1second
    input text      ${SearchBox.txt_search}   ${product}
    click element    ${SearchBox.btn_search}
    ${no_of_products}=    get element count      ${SearchBox.count_products}
    [Return]     ${no_of_products}

Validate_Footer_Link
    [Arguments]  ${link}
    Set Selenium Speed    1seconds
    Click Link    ${link}
    ${title}=  get title
    Log to console  ${title}
    ${is_cta_opened}=    Run Keyword And Return Status    Title Should Be    ${title}
    [Return]     ${is_cta_opened}

Session Handling
    [Arguments]  ${link}    ${link2}
    Click link   ${link}
    ${loc}=  Get Location
    click link     ${link2}
    ${loc1}=  Get Location
    [Return]  ${loc}  ${loc1}

Read Page Objects
    [Arguments]   ${loc}
    Set selenium speed  2seconds
    Go To       ${loc}
    Page should contain     Sign In
    [Return]  True

Get Locator From YAML
    [Arguments]     ${search_key}
    ${data}=       Load YAML    C:/Users/UV001096722/PycharmProjects/PetStore/PageObjects/Locators.yaml
    FOR    ${section}    IN    @{data.keys()}
        ${section_dict}=    Get From Dictionary     ${data}     ${section}
        ${has_key}=     Run Keyword And Return Status   Dictionary Should Contain Key   ${section_dict}     ${search_key}
        Run Keyword If  '${has_key}' == 'True'  Return From Keyword     ${section_dict}[${search_key}]
    END
    Fail    Locator with key '${search_key}' not found in any section.

AddItemToCart
    [Arguments]   ${itemname}     ${subcategory}   ${productid}
    ${element}=     Get Locator From YAML       ${itemname}
    ${link1}=   Get Locator From YAML       ${subcategory}
    ${link2}=   Get Locator From YAML       ${productid}
    click element    ${element}
    click link       ${link1}
    click link   ${link2}
    click link  ${Operations.addtocart}
    ${status}=    ValidateItems
    [Return]      ${status}

EditItem
    [Arguments]    ${productid}     ${quantity}
    ${link2}=   Get Locator From YAML       ${productid}
    input text   ${link2}     ${quantity}

RemoveItem
    Set Selenium Speed    1seconds
    ${rows}=    get element count   ${Operations.rowcount}
    Log To Console  ${rows}
    FOR     ${index}    IN RANGE    1   ${rows}+1
        Run Keyword If      ${index}==${rowtoremove}    click element   xpath=//*[@id='Cart']/form/table/tbody/tr[${index}]/td[8]/a
    END
    click element   ${Operations.updatecart}
    ${rows1}=    get element count   ${Operations.rowcount}
    Log To Console  ${rows1}
    ${status}=      Run keyword And Return Status   Should Not Be Equal As Integers  ${rows}    ${rows1}
    [Return]    ${status}

ValidateItems
    ${quantities}=    Get WebElements    ${Operations.quant}
    ${total}=         Set Variable       0
    FOR    ${q}    IN    @{quantities}
        ${val}=    Get Element Attribute    ${q}    value
        Run Keyword If    '${val}' == ''    Set Variable    ${val}    0
        ${val}=    Convert To Number        ${val}
        ${total}=  Evaluate                 ${total} + ${val}
    END
    Log To Console    Total quantity: ${total}
    ${inttotal}=    Convert To Integer  ${total}
    ${status}=    Run Keyword And Return Status    Should Be True    ${total} >= 1.0
    [Return]    ${status}

ValidateHomePageElements
    [Arguments]     ${field}
    Click Element   ${field}
    ${new_url}=     Get Location
    ${status}=      Run Keyword And Return Status   Should Not Be Equal     ${url}   ${new_url}
    Go Back
    [Return]    ${status}

Checking Payment
    [Arguments]     ${card}     ${number}    ${expiry}
    set selenium speed  1 second
    click link  ${Operations.proceedtocheckout}
    select from list by value   ${BillingAddress.cardtype}  ${card}
    input text   ${Billing.Addresscardnumber}   ${number}
    input text   ${BillingAddress.expirydate}      ${expiry}
    click button  ${Operations.Continue}
    click link  ${Operations.confirm}
    ${status}=   Run Keyword And Return Status    Page Should Contain        Thank you, your order has been submitted.
    [Return]  ${status}

Shipping to different address
    [Arguments]     ${card}     ${number}    ${expiry}   ${shiptofirstname}   ${shiptolastname}    ${shippingcity}     ${shippingaddress1}     ${shippingaddress2}    ${shippingzip}    ${shippingcountry}
    set selenium speed  1 second
    click link  ${Operations.proceedtocheckout}
    select from list by value   ${BillingAddress.cardtype}  ${card}
    input text   ${BillingAddress.cardnumber}   ${number}
    input text   ${BillingAddress.expirydate}      ${expiry}
    select check box    ${ShippingAddrtess.shipping}
    click button  ${Operations.Continue}
    input text  ${ShippingAddrtess.tshiptofirstname}     ${shiptofirstname}
    input text  ${ShippingAddrtess.tshiptolastname}      ${shiptolastname}
    input text  ${ShippingAddrtess.tshippingcity}        ${shippingcity}
    input text  ${ShippingAddrtess.tshippingaddress1}    ${shippingaddress1}
    input text  ${ShippingAddrtess.tshippingaddress2}    ${shippingaddress2}
    input text  ${ShippingAddrtess.tshippingzip}      ${shippingzip}
    input text  ${ShippingAddrtess.tshippingcountry}     ${shippingcountry}
    click button  ${Operations.Continue}
    click link  ${Operations.confirm}
    ${status}=   Run Keyword And Return Status    Page Should Contain        Thank you, your order has been submitted.
    [Return]  ${status}

Order_Review
    [Arguments]  ${name1}   ${address1}    ${name2}    ${address2}
    set selenium speed  1second
    click link  ${Operations.proceedtocheckout}
    input text  ${BillingandShippingData.billing_name}             ${name1}
    input text  ${BillingandShippingData.billing_address}          ${address1}
    select check box    ${ShippingAddrtess.shipping}
    click button  ${Operations.Continue}
    input text    ${BillingandShippingData.shipping_name}          ${name2}
    input text    ${BillingandShippingData.shipping_address}       ${address2}
    click element      ${Operations.proceedtocheckout}
    ${text} =  get text  ${BillingandShippingData.confirm_billing}
    ${text1} =  get text  ${BillingandShippingData.confirm_shipping}
    Should Be Equal     ${text}    ${text1}
    ${text2} =  get text  ${BillingandShippingData.confirm_saddress}
    ${text3} =  get text  ${BillingandShippingData.confirm_baddress}
    Should Be Equal     ${text2}    ${text3}
    ${status}=  Run Keyword And Return Status       Should Be Equal     ${text2}   ${text3}
    [Return]  ${status}

Validate Order Placed
    click link  ${HomePageElemets.account}
    click link  ${BillingandShippingData.my_orders}
    ${rows_count}=    get element count  ${Operations.row_count}
    ${rows_count}=    Convert To Integer  ${rows_count}
    log to console  ${rows_count}
    ${status}=  Set Variable    ${rows_count}
    [Return]  ${status}

Verify Internal Links
    [Arguments]     ${link}     ${link1}    ${link2}
    click element  ${link}
    click link  ${link1}
    click link  ${link2}
    go back
    go back
    go back
    ${status}=   Run Keyword And Return Status    Page Should Contain        Welcome
    [Return]    ${status}
