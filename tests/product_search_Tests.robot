*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../data/product_names.xlsx    sheet_name=products
Resource          ../pages/product_search_Pages.robot
Test Template     Search Product Template
Default Tags      search    smoke

*** Test Cases ***
Search Products

