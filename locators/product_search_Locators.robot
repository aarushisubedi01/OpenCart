*** Variables ***

# Search input box
${SEARCH_INPUT}          xpath=//input[@name='search']

# Search button
${SEARCH_BTN}            xpath=//div[@id='search']//button

# Product titles on search result page
${SEARCH_RESULTS}        xpath=//div[@class='caption']//a

# No product found message
${NO_PRODUCT_MSG}        xpath=//p[text()='Your shopping cart is empty!']
