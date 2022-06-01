*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${ICONE_CADASTRAR_MOVI}        //i[@class='fas fa-hand-holding-usd']
${DESCRICAO}                   //input[@placeholder='Descrição...'] 
${VALOR_CADASTRAR}             //input[@placeholder='Valor']
${NOME_INTERESSADO}            //input[contains(@placeholder,'Interessado...')]
${SELECT_CC}                    //option[contains(.,'Conta Corrente')]
${DATA}                        //input[@data-test='data-transacao']
${BTN_SALVAR}                  //button[@type='button'][contains(.,'Salvar')]
${MSG_MOVIMENTACAO_SUCESSO}    //div[@class='toast-message'][contains(.,'Movimentação inserida com sucesso!')]
${EXIBICAO_DE_MOVIMENTACAO}    //li[@data-test='mov-row']

*** Keywords ***
############### caso 08 #################
Quando clico no ícone Cadastrar movimentação
    Click Element    ${ICONE_CADASTRAR_MOVI}
E digito algo no campo Descrição
    Input Text    ${DESCRICAO}    Pagamento de relógio
E adiciono um valor no campo valor
    Input Text    ${VALOR_CADASTRAR}    200,00
Então digito o nome do interessado
    Input Text    ${NOME_INTERESSADO}    Krebinho
E seleciono a opção Conta Corrente    
    Click Element    ${SELECT_CC}
    Should Not Be Empty    ${DATA}
Então clico em Salvar
    Click Element    ${BTN_SALVAR}
E aparece a mensagem Movimentação inserida com sucesso
    Wait Until Element Is Visible    ${MSG_MOVIMENTACAO_SUCESSO}
    Wait Until Page Contains Element    ${EXIBICAO_DE_MOVIMENTACAO}   
    