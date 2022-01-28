*** Settings ***
Library         SeleniumLibrary
*** Variables ***
${URL}             https://dev.paisaplan.in/individual
${BROWSER}         chrome
${REGISTER-BUTTON}  //html/body/div/div[2]/div/div[3]/button[2]
${LOGIN-BUTTON}     //html/body/div/div[2]/div/div[3]/button[1]
${USERNAME}         id = username
${PASSWORD}         id = password
${SUBMIT}           //input[@id='kc-login']
${ADD}             //*[@id="root"]/div/div[1]/div[2]/div/div[2]/div[1]/div/div[2]/button/span[1]
${PROCEED}          //html/body/div[1]/div/div[1]/div[2]/div/div[3]/div/button/span[1]
*** Keywords ***
Open Website
     Open Browser    ${URL}     ${BROWSER}
     Maximize Browser Window
Login User
     Click Button     ${LOGIN-BUTTON}
     Input Text       ${USERNAME}      Ram.p
     Input Password   ${PASSWORD}      test
     Wait Until Page Contains Element    ${SUBMIT}
     Click Element    ${SUBMIT}
