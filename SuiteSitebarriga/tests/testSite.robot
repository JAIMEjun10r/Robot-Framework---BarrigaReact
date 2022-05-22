*** Settings ***
Resource    ../resources/Resource.robot
Resource    ../resources/Pages/home.robot
Resource    ../resources/Pages/contas.robot
Resource    ../resources/Pages/contas.robot
Test Setup        Abrir o navegador
#Test Teardown    Fechar o navegador    

*** Test Cases ***
Caso de teste 01: registrando um novo usuário
    [Tags]    Cad-Login
    Dado que acesso a página home do site
    E clico em Registrar
    E digito um nome
    E digito um email
    E digito uma senha
    Então clico em Regristrar
Caso de testes 02: logando com sucesso
    [Tags]    Cad-Login
    Dado que acesso a página home do site
    E digito um email e senha válidos
    E clico no botão entrar
Caso de teste 03: conferindo se o menu settings exibe 3 opções
    Dado que acesso a página home do site
    E digito um email e senha válidos
    E clico no botão entrar
    Quando clico em settings
    Então as opções Contas, Resetar e Sair devem estar visíveis

Caso de testes 04: criando uma conta corrente
    [Tags]    Contas
    Dado que acesso a página home do site
    E digito um email e senha válidos
    E clico no botão entrar
    Quando clico em settings
    Então clico em Contas
    E digito Conta Corrente
    Então clico no ícone azul de salvar