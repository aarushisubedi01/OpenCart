*** Settings ***
Library     SeleniumLibrary
Library     DataDriver    file=../data/registration_data.xlsx    sheet_name=registration
Resource    ../pages/login_Page.robot
Test Setup     Open Browser To Login
Test Teardown  Close Browser
Test Template   Login With Excel Data


*** Test Cases ***
Login Test Using Excel    ${firstname}    ${lastname}    ${email}    ${telephone}    ${password}    ${confirm_password}    ${newsletter}


*** Keywords ***
Open Browser To Login
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${MY_ACCOUNT_BTN}
    Click Element    ${LOGIN_LINK}

Login With Excel Data
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${telephone}    ${password}    ${confirm_password}    ${newsletter}

    Enter Email    ${email}
    Enter Password    ${password}
    Click Login Button

    ${login_success}=    Run Keyword And Return Status    Verify Login Successful

    Run Keyword If    ${login_success} == True
    ...    Log To Console    \n LOGIN SUCCESS for email: ${email}

    Run Keyword If    ${login_success} == True    Return From Keyword

    # If login failed → capture popup message
    ${popup_msg}=    Get Login Error Message
    Log To Console    \n LOGIN FAILED for email: ${email}
    Log To Console    ERROR MESSAGE: ${popup_msg}