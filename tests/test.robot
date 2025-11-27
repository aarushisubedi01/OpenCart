*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_CARD_LINKS}    xpath=//div[@class='product-thumb transition']//h4/a
${ADD_TO_CART_BTN}       xpath=//button[@id='button-cart']

*** Test Cases ***
Click Each Product And Add To Cart
    [tags]  cart
    Open Browser    https://opencart.abstracta.us/index.php?route=common/home    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${PRODUCT_CARD_LINKS}

    ${links}=    Get WebElements    ${PRODUCT_CARD_LINKS}
    FOR    ${link}    IN    @{links}
        Scroll Element Into View    ${link}
        Click Element    ${link}
        Sleep    1s

        Scroll Element Into View     ${ADD_TO_CART_BTN}
        Wait Until Element Is Visible    ${ADD_TO_CART_BTN}    10s
        Click Element    ${ADD_TO_CART_BTN}

        Sleep    1s
        Go Back
        Wait Until Page Contains Element    ${PRODUCT_CARD_LINKS}

        ${links}=    Get WebElements    ${PRODUCT_CARD_LINKS}

    END

    Close Browser
