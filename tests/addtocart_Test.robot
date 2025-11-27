*** Settings ***
Library         SeleniumLibrary
Library         DataDriver    file=../data/product_names.xlsx    sheet_name=products
Resource        ../pages/addtocart_Pages.robot
Suite Setup     Open Home Page
Suite Teardown  Close All Browsers
Test Template   Add Product Template

*** Test Cases ***
Add Product Test    ${product_name}

*** Keywords ***
Add Product Template
    [Arguments]    ${product_name}
    Search And Add Product ToCart    ${product_name}
