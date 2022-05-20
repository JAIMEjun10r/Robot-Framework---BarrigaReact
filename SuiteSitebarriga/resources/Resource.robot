*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Browser}    chrome

*** Keywords ***
Abrir o navegador
    Open Browser    about:blank    ${Browser}
    Maximize Browser Window
Fechar o navegador
     Close Browser
