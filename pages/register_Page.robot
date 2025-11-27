*** Settings ***
Library     SeleniumLibrary
Resource    ../locators/register_Locators.robot
Resource    ../variables/global_Variables.robot

*** Keywords ***
Open Register Page
    Open Browser    ${BASE_URL}     ${BROWSER}
    Maximize Browser Window
    Click Element       ${MY_ACCOUNT_BTN}
    Click Element       ${REGISTER_LINK}

Enter First Name
    [Arguments]     ${firstname}
    Input Text    ${FIRSTNAME_INPUT}    ${firstname}

Enter Last Name
    [Arguments]     ${lastname}
    Input Text    ${LASTNAME_INPUT}    ${lastname}

Enter Email
    [Arguments]     ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Enter Telephone
    [Arguments]     ${telephone}
    Input Text    ${TELEPHONE_INPUT}    {telephone}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Confirm Password
    [Arguments]    ${password}
    Input Text    ${CONFIRM_PASSWORD_INPUT}    ${password}

Select Newsletter Yes
    Click Element    ${NEWSLETTER_YES}

Select Newsletter No
    Click Element    ${NEWSLETTER_NO}

Accept Privacy Policy
    Click Element    ${PRIVACY_CHECKBOX}

Click Continue
    Click Button    ${CONTINUE_BTN}

Verify Registration Success
    Wait Until Element Is Visible    ${SUCCESS_MSG}    5s
    Page Should Contain Element     ${SUCCESS_MSG}
    Close Browser