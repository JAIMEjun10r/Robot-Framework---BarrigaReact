*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${INPUT_CONTA}                //input[contains(@type,'text')]
${BTN_SAVE_CONTA}            //button[contains(@class,'btn btn-primary btn-block')]
${CONTA_ALERT_SUCESSO}      //div[@class='toast toast-success'][contains(.,'×Conta inserida com sucesso!')]
${DELETE_CC}                //i[@class='far fa-trash-alt']
${DELETE_CP}                (//i[@class='far fa-trash-alt'])[2]
${CC_VISIVEL}                //td[contains(.,'Conta Corrente')]
${CP_VISIVEL}                //td[contains(.,'Conta Poupança')]
${ALERT_CONTA_EXCLUIDA}     //div[@class='toast-message'][contains(.,'Conta excluída com sucesso!')]


*** Keywords ***
E digito Conta Corrente
    Input Text    ${INPUT_CONTA}    Conta Corrente
Então clico no ícone azul de salvar
    Click Button    ${BTN_SAVE_CONTA}
E confiro se consta Conta Corrente como salva
    Wait Until Element Is Visible    ${CONTA_ALERT_SUCESSO} 
    Page Should Contain    Conta Corrente
#################### case 05 #####################
E digito Conta Poupança
    Input Text    ${INPUT_CONTA}    Conta Poupança
E confiro se consta Conta Corrente e Conta Poupança como salva
    Wait Until Element Is Visible    ${CONTA_ALERT_SUCESSO} 
    Page Should Contain    Conta Poupança
    Page Should Contain    Conta Corrente
##################### case 06 ######################
Quando clico em deletar Conta Corrente e Conta Poupança
    Wait Until Element Is Visible    ${CC_VISIVEL}
    Wait Until Element Is Visible    ${CP_VISIVEL} 
    Page Should Contain    Conta Corrente
    Page Should Contain    Conta Poupança
    Click Element    ${DELETE_CC}
    Click Element    ${DELETE_CP}
Então aparece mensagem dizendo Conta excluída com sucesso
   Wait Until Element Is Visible    ${ALERT_CONTA_EXCLUIDA}
   Page Should Not Contain    Conta Corrente
   Page Should Not Contain    Conta Poupança
   
   