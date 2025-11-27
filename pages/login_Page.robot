*** Settings ***
Resource    ../locators/login_Locators.robot
Resource    ../variables/global_Variables.robot
Library     SeleniumLibrary

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${MY_ACCOUNT_BTN}
    Click Element    ${LOGIN_LINK}

Enter Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Element    ${LOGIN_BTN}

Verify Login Successful
    Wait Until Element Is Visible    ${ACCOUNT_HEADER}      timeout=3s

Get Login Error Message
    Wait Until Page Contains Element    ${LOGIN_WARNING}    timeout=3s
    ${msg}=    Get Text    ${LOGIN_WARNING}
    [Return]    ${msg}