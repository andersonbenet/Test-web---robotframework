*** Settings ***
Library  SeleniumLibrary

*** Variable ***
${URL}  http://automationpractice.com
${BROWSER}  Firefox



*** Keywords ***

#TC 001: Consulta produto existente
Abrir browser 
    Open Browser  about:blank  ${BROWSER}  

Fechar browser 
    Close Browser

Dado que estou na página home
    Go To  ${URL}
    
Quando pesquisar pelo produto "${PRODUTO}"
    Input Text  id=search_query_top  ${PRODUTO}
    Click Element  name=submit_search

Entao o produto "Blouse" deve ser listado na view resultados
    Wait Until Element Is Visible  css=#center_column > h1
    Title Should Be  Search - My Store

#TC 002: Consulta produto não existente
Entao será apresentado a mensagem "${ERROR_MSG}"
    Wait Until Element Is Visible  //*[@id="center_column"]/p
    Element Text Should Be  //*[@id="center_column"]/p  ${ERROR_MSG}