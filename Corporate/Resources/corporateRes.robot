*** Settings ***
Library   SeleniumLibrary
*** Variables ***
# Browsers
${URL}            https://uat.paisaplan.in/corporate
${CAMUNDA_URL}    https://techsophy-platform.techsophy.com/model
${BROWSER}         chrome
# Register
${REGISTER-BUTTON}  //div[normalize-space()='Register']//img
${NAME}             //input[@id='mui-1']
${LASTNAME}         //input[@id='mui-2']
${EMAIL}            //input[@id='mui-3']
${CHOSE-USERNAME}    //input[@id='mui-4']
${MOBILE-NUMBER}     //input[@id='mui-5']
${SUBMIT-DETAILS}     //button[@class='jss3']
# Login
${LOGIN-BUTTON}     //html/body/div/div[2]/div/div[3]/button[1]
${USERNAME}         id = username
${PASSWORD}         id = password
${SUBMIT}           //input[@id='kc-login']
# Add Policy
${ADD-AN-EXISTING-POLICY}             //span[normalize-space()='ADD AN EXISTING POLICY']
${PROCEED}              //span[normalize-space()='Proceed']
${UPLOAD-DOCUMENT}      //button[normalize-space()='Upload Document']
${ENTER-MANUALLY}       //button[normalize-space()='Enter Manually']
${SXP-INPUT}         //textarea[@placeholder='Write your message...']
${SEND-INPUT}        //img[@alt='Send']
${VIEW-ALL}          //a[normalize-space()='ViewAll']
${UPLOAD-POLICY}    //span[normalize-space()='Upload Policy']
${UPLOAD-BUTTON}    //img[@alt='File Input']
${POLICY-TILE}      //html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[1]/div[1]/div[1]/div[1]/div[1]/img[1]
${ANNEXURE-PROCEED}   //img[@alt='proceedArrow']
${UPLOAD-ANNEXURE}    //span[normalize-space()='Upload Annexure']
${EDORSEMENT}         //span[@class='MuiTab-wrapper'][normalize-space()='Endorsement']
${REQUEST-ENDORSEMENT}   //span[normalize-space()='Request an Endorsement']
${POLICY-CORRECTIONS}    //button[@class='quick-button']
${CLAIM-HISTORY}        //span[normalize-space()='Claim History']
${RENEW-HISTORY}        //span[normalize-space()='Renew History']
# Camunda
${TASK-LIST}            //div[@class='tasklist-app ng-scope col-xs-4']//a[@class='app-label-wrapper']
${ALL-TASKS}            //div[@class='item task-filter cells-wrapper ng-scope active']//a[@class='ng-binding']
${SELECT-TASK}          //li[1]//div[1]//div[1]//h4[1]//a[1]
${CLAIM}                //a[@class='claim ng-scope']

*** Keywords ***
Open Website
     Open Browser    ${URL}     ${BROWSER}
     Maximize Browser Window
Open Camunda Website
     Open Browser    ${CAMUNDA_URL}    ${BROWSER}
     Maximize Browser Window
Login User
     Click Button     ${LOGIN-BUTTON}
     Input Text       ${USERNAME}        santosh.n
     Input Password   ${PASSWORD}      test
     Wait Until Page Contains Element    ${SUBMIT}
     Click Element    ${SUBMIT}
View all
       Wait Until Page Contains Element   ${VIEW-ALL}
       Click Element        ${VIEW-ALL}
Upload Policy
      Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Wait Until Page Contains Element   ${UPLOAD-POLICY}
     Click Element        ${UPLOAD-POLICY}
     Wait Until Page Contains Element    ${UPLOAD-BUTTON}
#     Click Element           ${UPLOAD-BUTTON}
     Choose File    id=file-input            ${CURDIR}${/}policy.pdf
Policy Tile
      Wait Until Page Contains Element     ${POLICY-TILE}
      Click Element                        ${POLICY-TILE}
Add Annexure
      Policy Tile
      Sleep    1s
      Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
      Wait Until Page Contains Element      ${ANNEXURE-PROCEED}
      Click Element                         ${ANNEXURE-PROCEED}
      Wait Until Page Contains Element      ${UPLOAD-DOCUMENT}
      Click Element                         ${UPLOAD-DOCUMENT}
#      Wait Until Page Contains Element      ${UPLOAD-BUTTON}
#      Click Element                         ${UPLOAD-BUTTON}
     Choose File     id=file-input        ${CURDIR}${/}Asset Annexure.xlsx
Add Endorsement
#       Policy Tile
        Wait Until Page Contains Element      //html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[2]/div[1]/div[1]/div[1]/div[1]
        Click Element          //html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[2]/div[1]/div[1]/div[1]/div[1]
       Wait Until Page Contains Element    ${EDORSEMENT}
       Click Element                       ${EDORSEMENT}
       Sleep    1s
#       Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#       Wait Until Page Contains Element  ${EDORSEMENT}
#       Click Element                     ${EDORSEMENT}
#       Wait Until Page Contains Element     /html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[4]/div[1]/div[1]/div[1]/div[5]/div[2]/a[1]/button[1]/span[1]
#       Click Element                       /html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[4]/div[1]/div[1]/div[1]/div[5]/div[2]/a[1]/button[1]/span[1]
       Wait Until Page Contains Element   ${REQUEST-ENDORSEMENT}
       Click Element                       ${REQUEST-ENDORSEMENT}
       Wait Until Page Contains Element    ${POLICY-CORRECTIONS}
       Click Element                       ${POLICY-CORRECTIONS}
#       Wait Until Page Contains Element    //button[normalize-space()='Upload']
#       Click Element                       //button[normalize-space()='Upload']
#       Wait Until Page Contains Element    ${UPLOAD-BUTTON}
#       Click Element           ${UPLOAD-BUTTON}
      Choose File    id=file-input       ${CURDIR}${/}file-1640153796596.xlsx
Claim History
       Policy Tile
       Wait Until Page Contains Element    ${CLAIM-HISTORY}
       Click Element       ${CLAIM-HISTORY}
Renew History
       Policy Tile
       Wait Until Page Contains Element    ${RENEW-HISTORY}
       Click Element       ${RENEW-HISTORY}
#Document Uploading
#      [Arguments]        ${FileType}
#       Sleep    1s
#       Wait For Active Window    WindowTitle=Open
#       Win Activate   Open
#       Send  strSendText= ${FileType}
#       Sleep    2s
#       Control Click    Open   &Open   [CLASS:Button; INSTANCE:1]  LEFT
Open Camunda
     Open Camunda Website
     Input Text       ${USERNAME}      test
     Input Password   ${PASSWORD}      test
     Wait Until Page Contains Element    ${SUBMIT}
     Click Element    ${SUBMIT}
     Wait Until Page Contains Element     ${TASK-LIST}
     Click Element                        ${TASK-LIST}
     Wait Until Page Contains Element     ${ALL-TASKS}
     Click Element                        ${ALL-TASKS}
     Wait Until Page Contains Element     ${SELECT-TASK}
     Click Element                        ${SELECT-TASK}
Upload File
     Choose File    id=file-input            ${CURDIR}${/}policy.pdf

