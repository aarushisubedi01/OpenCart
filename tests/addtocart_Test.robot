*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/addtocart_Pages.robot

*** Test Cases ***
Click Each Product And Verify Cart
    Open Home Page

    ${links}=    Get All Product Links

    FOR    ${product}    IN    @{links}
        Open Product    ${product}

        Add Product To Cart
        Verify Product In Cart

        Return To Home Page
        ${links}=    Get All Product Links
    END

    Close Browser
