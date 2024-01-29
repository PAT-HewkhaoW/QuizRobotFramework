# TEST CASE 20

*** Settings ***
Documentation      Test Case 20 : Search Products and Verify Cart After Login
Library            SeleniumLibrary
Suite Setup        Open Browser  http://automationexercise.com
Suite Teardown     Close Browser

*** Variables ***

${EMAIL}      userRobotTest@mail.com
${PASSWORD}   password
${SEARCH}     shirt

*** Keywords ***

input EMAIL
    [Arguments]  ${EMAIL}
    Input Text  //*[@id="form"]/div/div/div[1]/div/form/input[2]  ${EMAIL}

input PASSWORD
    [Arguments]  ${PASSWORD}
    Input Text  //*[@id="form"]/div/div/div[1]/div/form/input[3]  ${PASSWORD}

click LOGIN Button
    Click Button  //*[@id="form"]/div/div/div[1]/div/form/button

click PRODUCTS Button
    Click Link  xpath=//a[@href="/products"]
    Sleep  10s

input SEARCH PRODUCTS 
    [Arguments]  ${SEARCH}
    Input Text  //*[@id="search_product"]  ${SEARCH}

click SEARCH Button
    Click Button  //*[@id="submit_search"]

clicck DISMISS Button 
    Click Button  //*[@id="dismiss-button"]

click CART Button
    Click Link  xpath=//a[@href="/view_cart"]
    Sleep  10s

click ADD TO CART Button
    Sleep  5s
    Click Element  xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/span/button

click SIGNUP / LOGIN Button
    Click Link  xpath=//[@href="/login"]

click CONTINUE SHOPPING Button
    Click Element  //*[@id="cartModal"]/div/div/div[3]/button
    
click VIEW PRODUCT Button
    Click Element  xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[2]/ul/li/a]
*** Test Cases ***

Search Products and Verify Cart After Login
    [Documentation]  Test case 20
    click PRODUCTS Button
    # clicck DISMISS Button
    Page Should Contain  All Products
    input SEARCH PRODUCTS  SEARCH=${SEARCH}
    click SEARCH Button
    Page Should Contain  Searched Products
    Wait Until Location Contains  products?search=shirt
    Mouse Over  xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div
    click VIEW PRODUCT Button
    click ADD TO CART Button

    # Page Should Contain Element   /html/body/section[2]/div[1]/div/div[2]/div/div[3]/div/div[1]/div[1]/a
    click CART Button

    Page Should Contain Element  locator=//*[id="product-2"]
    click SIGNUP / LOGIN Button
    input EMAIL        ${EMAIL}
    input PASSWORD     ${PASSWORD}
    click SIGNUP / LOGIN Button
    click CART Button
    Page Should Contain Element  locator=//*[id="product-2"]



    