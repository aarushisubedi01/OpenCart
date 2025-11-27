*** Variables ***
#Home Page
${MY_ACCOUNT_BTN}       xpath=//a[contains(@title,"My Account")]
${LOGIN_LINK}       xpath=//a[contains(@href,'account/login')]

#Login Page
${EMAIL_INPUT}      id=input-email
${PASSWORD_INPUT}   id=input-password
${LOGIN_BTN}       xpath=//input[@value='Login']

#Dashboard
${ACCOUNT_HEADER}       xpath=//h2[text()='My Account']

#Alert messsage
${LOGIN_WARNING}    xpath=//div[contains(@class,'alert') and contains(.,'Warning')]