*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}        https://barrigareact.wcaquino.me/
${HOME_LOGIN}              //a[@class='nav-link active'][contains(.,'Login')]
${HOME_REGISTRAR}          //a[@class='nav-link'][contains(.,'Registrar')]
${HOME_REGISTRAR_NOME}     //input[contains(@type,'text')]    
${HOME_REGISTRAR_EMAIL}    //input[contains(@type,'email')]
${HOME_REGISTRAR_SENHA}    //input[@type='password']
${HOME_REGISTRAR_BTN}      //button[@type='submit'][contains(.,'Registrar')] 
${HOME_ALERT_SUCESSO}      //div[@class='toast-message'][contains(.,'Usuário adicionado com sucesso')]
${HOME_LOGIN_EMAIL}        //input[contains(@data-test,'email')]
${HOME_LOGIN_PWD}          //input[@type='password']
${HOME_LOGIN_BTNENTRAR}    //button[@type='submit'][contains(.,'Entrar')]
${ALERT_WELCOME}           //div[@class='toast-message'][contains(.,'Bem vindo, Bernardos!')]

*** Keywords ***
Dado que acesso a página home do site    
    Go To    ${URL}
    Wait Until Element Is Visible    ${HOME_LOGIN}
    Title Should Be    React App
 E clico em Registrar
     Click Element    ${HOME_REGISTRAR}
 E digito um nome
     Input Text    ${HOME_REGISTRAR_NOME}    Bernardos
E digito um email

    Input Text    ${HOME_REGISTRAR_EMAIL}    cab1a@gmail.com
 E digito uma senha
     Input Text    ${HOME_REGISTRAR_SENHA}    1234
Então clico em Regristrar
    Click Element    ${HOME_REGISTRAR_BTN} 
    Wait Until Element Is Visible   ${HOME_ALERT_SUCESSO}  
############ case 02 ###################
E digito um email válido
    Input Text    ${HOME_LOGIN_EMAIL}    cab1a@gmail.com    
E digito uma senha válida  
    Input Text    ${HOME_LOGIN_PWD}    1234        
E clico no botão entrar
    Click Button    ${HOME_LOGIN_BTNENTRAR}
    Wait Until Element Is Visible   ${ALERT_WELCOME} 