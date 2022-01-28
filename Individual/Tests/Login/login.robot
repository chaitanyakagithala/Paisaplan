*** Settings ***
Resource    ../../Resources/loginRes.robot
Library       SeleniumLibrary
*** Test Cases ***
Login User
       Open Website
       Login User
       Wait Until Page Contains Element   ${ADD}
       Click Element    ${ADD}
       Wait Until Page Contains Element    ${PROCEED}
       Wait Until Element Is Visible    ${PROCEED}
       Click Element    ${PROCEED}
