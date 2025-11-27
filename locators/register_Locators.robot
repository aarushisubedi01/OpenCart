*** Variables ***

#Navigate to Register Page
${MY_ACCOUNT_BTN}       xpath=//a[contains(@title,"My Account")]

${REGISTER_LINK}        xpath=//a[contains(@href,'account/register')]

# Registration Form Fields
${FIRSTNAME_INPUT}             id=input-firstname
${LASTNAME_INPUT}              id=input-lastname
${EMAIL_INPUT}                 id=input-email
${TELEPHONE_INPUT}             id=input-telephone
${PASSWORD_INPUT}              id=input-password
${CONFIRM_PASSWORD_INPUT}      id=input-confirm

#Newsletter Radio Buttons
${NEWSLETTER_YES}              xpath=//input[@name='newsletter' and @value='1']
${NEWSLETTER_NO}               xpath=//input[@name='newsletter' and @value='0']

# Privacy Policy Checkbox
${PRIVACY_CHECKBOX}            name=agree

#Continue/Submit Button
${CONTINUE_BTN}                xpath=//input[@value='Continue']

# After Registration Confirmation
${SUCCESS_MSG}                 xpath=//div[@id='content']//p[text()='Congratulations! Your new account has been successfully created!']