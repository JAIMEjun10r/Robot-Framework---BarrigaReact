*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${INPUT_CONTA}                //input[contains(@type,'text')]
${BTN_SAVE_CONTA}            //button[contains(@class,'btn btn-primary btn-block')]
${CONTA_ALERT_SUCESSO}      //div[@class='toast toast-success'][contains(.,'×Conta inserida com sucesso!')]
${DELETE_CC}                (//i[contains(@class,'far fa-trash-alt')])[1]
${DELETE_CP}                //i[@class='far fa-trash-alt']
${CC_VISIVEL}                //td[contains(.,'Conta Corrente')]
${CP_VISIVEL}                //td[contains(.,'Conta Poupança')]
${ALERT_CONTA_EXCLUIDA}     //div[@class='toast-message'][contains(.,'Conta excluída com sucesso!')]
${ALTERAR_CONTA}            //i[contains(@class,'far fa-edit')]
${CLEAR_ELEMENT}            //input[contains(@type,'text')]


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
    Wait Until Element Is Not Visible    ${CC_VISIVEL}
    Click Element    ${DELETE_CP}
    Wait Until Element Is Not Visible    ${CP_VISIVEL} 
Então aparece mensagem dizendo Conta excluída com sucesso
   Wait Until Element Is Visible    ${ALERT_CONTA_EXCLUIDA}
   Page Should Not Contain    Conta Corrente
   Page Should Not Contain    Conta Poupança
######################## case 07 #######################
Quando clico no ícone de alterar
    Click Element    ${ALTERAR_CONTA}
E digito Conta Salário
    Clear Element Text    ${CLEAR_ELEMENT}
    Input Text    ${CLEAR_ELEMENT}    Conta Salário
E confiro se consta Conta Salário e não Conta Corrente
    Wait Until Page Does Not Contain    Conta Corrente
    Wait Until Page Contains    Conta Salário    
   