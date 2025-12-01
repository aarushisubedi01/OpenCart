*** Settings ***
Library    SeleniumLibrary
Library    String
Library    BuiltIn
Resource   ../locators/product_search_Locators.robot

*** Keywords ***

Open Home Page
    Open Browser    https://opencart.abstracta.us/index.php?route=common/home    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_INPUT}    timeout=10s

Enter Search Text
    [Arguments]    ${search_keyword}
    Input Text    ${SEARCH_INPUT}    ${search_keyword}

Click Search Button
    Click Button    ${SEARCH_BTN}
    Sleep    1s

Get Search Results
    ${results}=    Get WebElements    ${SEARCH_RESULTS}
    RETURN    ${results}

Verify Search Result Contains
    [Arguments]    ${search_keyword}
    ${results}=    Get Search Results
    ${found}=    Set Variable    False

    FOR    ${item}    IN    @{results}
        Scroll Element Into View    ${item}
        ${name}=    Get Text    ${item}
        ${name}=    Strip String    ${name}
        Run Keyword If    '${search_keyword.lower()}' in '${name.lower()}'    ${found}=    Set Variable    True
    END

    Should Be True    ${found}    msg=No search result contains a product matching '${search_keyword}'

Verify No Product Message
    Wait Until Page Contains Element    ${NO_PRODUCT_MSG}    timeout=10s

Search Product Template
    [Arguments]    ${search_keyword}    ${expected_result}
    Open Home Page
    Enter Search Text    ${search_keyword}
    Click Search Button
    Run Keyword If    '${expected_result}'=='success'    Verify Search Result Contains    ${search_keyword}
    ...    ELSE    Verify No Product Message
    Close Browser
