*** Settings ***
Resource  ../resource/SiteResource.robot
Test Setup  Abrir browser
Test Teardown  Fechar browser

*** Test Case ***
TC 001: Consulta produto existente
    Dado que estou na página home
    Quando pesquisar pelo produto "Blouse"
    Entao o produto "Blouse" deve ser listado na view resultados


*** Test Case ***
TC 002: Consulta produto não existente
    Dado que estou na página home
    Quando pesquisar pelo produto "produtoInvalido"
    Entao será apresentado a mensagem "No results were found for your search "produtoInvalido""