*** Settings ***
Library   SeleniumLibrary
*** Variables ***
# Browsers
${URL}            https://uat.paisaplan.in/corporate
${CAMUNDA_URL}    https://dev.paisaplan.in/camunda
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
${Add-An-First-Existing-Policy}        //p[text()="Add an Existing Policy"]
${PROCEED}                        //span[normalize-space()='Click Here to proceed']
${Simply-Upload-Policy}          //button[@value='UD']
${No}                           //button[@value='no']
${Yes}                         //button[@value='yes']
${ENTER-MANUALLY}              //button[@value='EM']
${SXP-INPUT}                  //input[@placeholder='Enter your Message here...']
${SEND-INPUT}               //img[@src='http://sxp-stage.techsophy.com/assets/images/send.png']
${VIEW-ALL}                  //a[normalize-space()='ViewAll']
${UPLOAD-POLICY}            //span[text()="Upload Policy"]
${Upload-Document}            //button[@value='UPLOAD']
${POLICY-TILE}            //html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/a[1]/div[1]/div[1]/div[1]/div[1]/img[1]
${ANNEXURE-PROCEED}   //img[@alt='proceedArrow']
${UPLOAD-ANNEXURE}    //span[normalize-space()='Upload Annexure']
${EDORSEMENT}          //span[@class='MuiTab-wrapper'][normalize-space()='Endorsement']
${REQUEST-ENDORSEMENT}       //span[normalize-space()='Request an endorsement']
${Re-Request-endorsement}    //span[normalize-space()='Request an Endorsement']
${POLICY-CORRECTIONS}    //button[@value='Endorsement-Policy Corrections']
${Employe-Add-Del}       //button[@value='Endorsement-Addition/ Deletion']
${Employe-Assert-Details}    //button[@value='Endorsement-Details Corrections']
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
     Input Text       ${USERNAME}       chaitanyak939@gmail.com
     Input Password   ${PASSWORD}      test
     Wait Until Page Contains Element    ${SUBMIT}
     Click Element    ${SUBMIT}
View all
       Wait Until Page Contains Element   ${VIEW-ALL}
       Click Element        ${VIEW-ALL}
Upload Policy
     Wait Until Page Contains Element   ${UPLOAD-POLICY}
     Click Element        ${UPLOAD-POLICY}
     Sleep   1s
     Upload File
     Sleep  5s
     Wait Until Page Contains Element    //div[contains(text(),'Your Policy Document is uploaded successfully. We ')]//b[contains(text(),'...view more')]
     Click Element                        //div[contains(text(),'Your Policy Document is uploaded successfully. We ')]//b[contains(text(),'...view more')]
     Wait Until Page Contains Element   //a[@href='https://uat.paisaplan.in/corporate/dashboard/']
     Click Element                        //a[@href='https://uat.paisaplan.in/corporate/dashboard/']
Policy Tile Assert
      Wait Until Page Contains Element     //p[text()="Accidental Insurance"]
      Click Element                       //p[text()="Endowment Policy"]
Policy Tile Employe
      Wait Until Page Contains Element      //p[text()="Group Health Insurance"]
      Click Element                       //p[text()="Group Health Insurance"]
Claim History
       Policy Tile Employe
       Wait Until Page Contains Element    ${CLAIM-HISTORY}
       Click Element       ${CLAIM-HISTORY}
Renew History
       Policy Tile Assert
       Wait Until Page Contains Element    ${RENEW-HISTORY}
       Click Element       ${RENEW-HISTORY}
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
     Choose File    id=uploadInput            ${CURDIR}${/}policy.pdf

Add First Policy
     Wait Until Page Contains Element   ${Add-An-First-Existing-Policy}
     Click Element                      ${Add-An-First-Existing-Policy}
Add Further more Polices
    Wait Until Page Contains Element     ${ADD-AN-EXISTING-POLICY}
    Click Element                      ${ADD-AN-EXISTING-POLICY}
Update Annexure
    Wait Until Page Contains Element      //a[normalize-space()='Update Annexure']
    Click Element                          //a[normalize-space()='Update Annexure']
    sleep   3s
    Choose File     id=uploadInput        ${CURDIR}${/}EA.xlsx
Upload Fresh Annexurre
      Wait Until Page Contains Element      ${ANNEXURE-PROCEED}
      Click Element                         ${ANNEXURE-PROCEED}
      Wait Until Page Contains Element      ${Upload-Document}
      Click Element                         ${Upload-Document}
      Choose File     id=uploadInput        ${CURDIR}${/}EA.xlsx
      Wait Until Page Contains Element     //b[text()="...view more"]
      Click Element                         //b[text()="...view more"]
      Wait Until Page Contains Element      //html/body/div[4]/div[2]/div[2]/div[7]/p/div/a
      Click Element                         //html/body/div[4]/div[2]/div[2]/div[7]/p/div/a
Update Assert
    Wait Until Page Contains Element      //a[normalize-space()='Update Asset']
    Click Element                         //a[normalize-space()='Update Asset']
    sleep   3s
    Choose File     id=uploadInput        ${CURDIR}${/}AssertAnnex.xlsx
Upload Fresh Assert
      Wait Until Page Contains Element      ${ANNEXURE-PROCEED}
      Click Element                         ${ANNEXURE-PROCEED}
      Wait Until Page Contains Element      ${Upload-Document}
      Click Element                         ${Upload-Document}
      sleep   3s
      Choose File     id=uploadInput        ${CURDIR}${/}AssertAnnex.xlsx
      Wait Until Page Contains Element     //b[text()="...view more"]
      Click Element                         //b[text()="...view more"]
      Wait Until Page Contains Element      //html/body/div[4]/div[2]/div[2]/div[7]/p/div/a
      Click Element                         //html/body/div[4]/div[2]/div[2]/div[7]/p/div/a
Add endrosement for policy corrections
      Choose File     id=uploadInput        ${CURDIR}${/}PolicyCorrections.xlsx
      Wait Until Page Contains Element     //b[text()="...view more"]
      Click Element                         //b[text()="...view more"]
      Wait Until Page Contains Element      //a[normalize-space()='Click Here']
      Click Element                         //a[normalize-space()='Click Here']
Add endrosement for Employe addition/deletion
      Choose File     id=uploadInput        ${CURDIR}${/}AssertDelAdd.xlsx
       Wait Until Page Contains Element     //b[text()="...view more"]
      Click Element                         //b[text()="...view more"]
      Wait Until Page Contains Element      //a[normalize-space()='Click Here']
      Click Element                         //a[normalize-space()='Click Here']
Add endrosement for Employe assert details
       Choose File     id=uploadInput        ${CURDIR}${/}AssertDetails.xlsx
       Wait Until Page Contains Element     //b[text()="...view more"]
      Click Element                         //b[text()="...view more"]
      Wait Until Page Contains Element      //a[normalize-space()='Click Here']
      Click Element                         //a[normalize-space()='Click Here']
Update endorsement
   Wait Until Page Contains Element       ${Re-Request-endorsement}
   Click Element                          ${Re-Request-endorsement}
New endorsement
   Wait Until Page Contains Element      ${REQUEST-ENDORSEMENT}
   Click Element                          ${REQUEST-ENDORSEMENT}
Multiple Polices
      Wait Until Page Contains Element    ${ENTER-MANUALLY}
      Click Element          ${ENTER-MANUALLY}
      Sleep      1s
      Input Text        ${SXP-INPUT}          aditya
      Click Element     ${SEND-INPUT}
      Wait Until Page Contains Element       //button[@value='Aditya Birla Health Insurance Co. Ltd.::2::GENERAL']
      Click Element                        //button[@value='Aditya Birla Health Insurance Co. Ltd.::2::GENERAL']
      Wait Until Page Contains Element      //button[@value='Marine Insurance::17::General Insurance']
      Click Element                         //button[@value='Marine Insurance::17::General Insurance']
      Input Text             ${SXP-INPUT}         1000
      Click Element          ${SEND-INPUT}
      Input Text             ${SXP-INPUT}         100000
      Click Element          ${SEND-INPUT}
      Wait Until Page Contains Element         ${No}
      Click Element                            ${No}
      Input Text             ${SXP-INPUT}      31-12-2021
      Click Element          ${SEND-INPUT}
      Input Text             ${SXP-INPUT}      01-02-2023
      Click Element          ${SEND-INPUT}
      Wait Until Page Contains Element         //button[@value='Submit']
      Click Element                            //button[@value='Submit']
      Wait Until Page Contains Element         //button[@value='upload']
      Click Element                             //button[@value='upload']
      Upload File
      Wait Until Page Contains Element     ${No}
      Click Element                        ${No}
      Wait Until Page Contains Element        //a[normalize-space()='Click Here to go to the home screen']
      Click Element                           //a[normalize-space()='Click Here to go to the home screen']
      sleep     5s
      Close Window