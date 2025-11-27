*** Settings ***
Library  SeleniumLibrary
Resource        ../variables/globalvariables.robot

*** Keywords ***
Open Website
    Open Browser        ${BASE_URL}     ${BROWSER}
    Maximize Browser Window
