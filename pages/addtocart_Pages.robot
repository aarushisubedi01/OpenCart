*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../locators/addtocart_Locators.robot
Library    SeleniumLibrary
Library    String
Resource   ../locators/addtocart_Locators.robot

*** Keywords ***

Open Home Page
    Open Browser    https://opencart.abstracta.us/index.php?route=common/home    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${PRODUCT_CARD_LINKS}

Get All Product Links
    ${links}=    Get WebElements    ${PRODUCT_CARD_LINKS}
    RETURN    ${links}

Open Product
    [Arguments]    ${product}
    ${product_name}=    Get Text    ${product}
    Set Test Variable    ${CURRENT_PRODUCT}    ${product_name}
    Scroll Element Into View    ${product}
    Click Element    ${product}

Add Product To Cart
    Scroll Element Into View    ${ADD_TO_CART_BTN}
    Click Element    ${ADD_TO_CART_BTN}
    Sleep    1s

Verify Product In Cart
    Click Element    ${CART_BUTTON}
    Sleep    2s

    ${products}=    Get WebElements    xpath=//ul[@class='dropdown-menu pull-right']/li//td[@class='text-left']/a
    Set Test Variable    ${found}    False

    FOR    ${item}    IN    @{products}
        ${name}=    Get Text    ${item}
        ${name}=    Strip String    ${name}
        Log To Console    Cart Item Found: ${name}
        Run Keyword If    '${CURRENT_PRODUCT}' in '${name}'    Set Test Variable    ${found}    True
    END

    Should Be True    ${found}    msg=Product ${CURRENT_PRODUCT} NOT found in the cart!


Return To Home Page
    Go Back
    Wait Until Page Contains Element    ${PRODUCT_CARD_LINKS}
