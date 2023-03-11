*** Settings ***
Documentation    Robot Framework Sem Complicação
Library    SeleniumLibrary    timeout=6000
Library    Process

*** Variables ***
${url}    https://www.demoblaze.com
${navegador}    chrome
*** Keywords ***
Adicionar itens carrinho de compra
    Click Link    Laptops   
    Wait Until Element Is Visible     link=MacBook Pro 
    Click Link    MacBook Pro
    Wait Until Element Is Visible     link=Add to cart 
    # Click Link    Add to cart
    #fazendo por  xpath o  click no link 'Add to cart'
    Wait Until Element Is Visible     xpath=//div[2]/div/a
    Click Element    xpath=//div[2]/div/a
    Alert Should Be Present
    Wait Until Element Is Visible     link=PRODUCT STORE
    Click Link    PRODUCT STORE
    Wait Until Element Is Visible     link=Samsung galaxy s6
    Click Link    Samsung galaxy s6 
    Wait Until Element Is Visible     link=PRODUCT STORE
    Click Link    PRODUCT STORE
    Wait Until Element Is Visible     link=Nokia lumia 1520
    Click Link    Nokia lumia 1520 
    Wait Until Element Is Visible     link=PRODUCT STORE
    Click Link    PRODUCT STORE 
    Wait Until Element Is Visible     link=Cart
    Click Link    Cart
Formulario
    Wait Until Element Is Visible     id=name
    Input Text    name    Rodrigo
    Wait Until Element Is Visible     id=country
    Input Text    country    Brasil
    Wait Until Element Is Visible     id=city
    Input Text    city    Santos
    Wait Until Element Is Visible     id=card
    Input Text    card    2324423
    Wait Until Element Is Visible     id=month
    Input Text    month    02/12
    Wait Until Element Is Visible     id=year
    Input Text    year    2023

*** Test Cases ***

teste
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Adicionar itens carrinho de compra
    Click Button    Place Order
    Formulario
    Click Button    xpath=//button[text()='Purchase']
    Element Text Should Be    css=.sweet-alert > h2     Thank you for your purchase!
    Wait Until Element Is Visible     css=.confirm 
    Click Button    css=.confirm  
