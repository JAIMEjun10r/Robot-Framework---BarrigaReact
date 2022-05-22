*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${INPUT_CONTA}                //input[contains(@type,'text')]
${BTN_SAVE_CONTA}            //button[contains(@class,'btn btn-primary btn-block')]
${CONTA_ALERT_SUCESSO}      //div[@class='toast toast-success'][contains(.,'×Conta inserida com sucesso!')]


*** Keywords ***
E digito Conta Corrente
    Input Text    ${INPUT_CONTA}    Conta Corrente
Então clico no ícone azul de salvar
    Click Button    ${BTN_SAVE_CONTA}
    Wait Until Element Is Visible    ${CONTA_ALERT_SUCESSO} 
    Page Should Contain    Conta Corrente
