*** Settings ***
Library     SeleniumLibrary
Resource    ../locators/addtocart_Locators.robot
Resource    ../variables/global_Variables.robot

*** Keywords ***

Open Home Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_BOX}    timeout=15s

Search And Add Product ToCart
    [Arguments]    ${product_name}

    # Search for product
    Input Text    ${SEARCH_BOX}    ${product_name}
    Click Button  ${SEARCH_BTN}

    # Wait until product card appears
    ${product_card_xpath}=    Set Variable    xpath=//div[contains(@class,'product-thumb')]//a[normalize-space(text())='${product_name}']/ancestor::div[contains(@class,'product-thumb')]

    Wait Until Element Is Visible    ${product_card_xpath}    timeout=10s

    # Scroll page gradually until product card is visible
    FOR    ${i}    IN RANGE    20
        ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${product_card_xpath}
        Run Keyword If    '${visible}'=='True'    Exit For Loop
        Scroll Element Into View    xpath=//div[@id='content']
        Sleep    0.5s
    END

    # Click Add to Cart button inside the product card
    ${add_btn_xpath}=    Set Variable    ${product_card_xpath}//button[@id='button-cart']
    Click Element    ${add_btn_xpath}
