*** Settings ***
Resource    ../resources/Resource.robot
Resource    ../resources/PO/home.robot
Test Setup        Abrir o navegador
Test Teardown    Fechar o navegador    

*** Test Cases ***
Caso de teste 01: registrando um novo usuário
    Dado que acesso a página home do site
    E clico em Registrar
    E digito um nome
    E digito um email
    E digito uma senha
    Então clico em Regristrar
Caso de testes 02: logando com sucesso
    Dado que acesso a página home do site
    E digito um email válido
    E digito uma senha válida
    E clico no botão entrar
