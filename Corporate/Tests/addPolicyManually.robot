*** Settings ***
Resource    ../Resources/corporateRes.robot
Resource    C:\Users\chaitanya.k\PycharmProjects\PaisaPlan\venv\Lib\site-packages\robotframework_metrics\robotmetrics.py
Library    SeleniumLibrary

*** Test Cases ***
Adding policy Manually
          Open Website
          Login User
          Wait Until Page Contains Element    ${ADD-AN-EXISTING-POLICY}
          Click Element                       ${ADD-AN-EXISTING-POLICY}
          Wait Until Page Contains Element    ${PROCEED}
          Click Element                       ${PROCEED}
          Wait Until Page Contains Element    ${ENTER-MANUALLY}
          Click Element          ${ENTER-MANUALLY}
          Sleep      1s
          Input Text        ${SXP-INPUT}          lib
          Click Element     ${SEND-INPUT}
          Wait Until Page Contains Element       //button[normalize-space()='Liberty General Insurance Ltd.']
          Click Element                          //button[normalize-space()='Liberty General Insurance Ltd.']
          Wait Until Page Contains Element       //button[normalize-space()='Motor Insurance']
          Click Element                          //button[normalize-space()='Motor Insurance']
          Wait Until Page Contains Element       //button[normalize-space()='Two-Wheeler']
          Click Element                           //button[normalize-space()='Two-Wheeler']
          Input Text             ${SXP-INPUT}         1000
          Click Element          ${SEND-INPUT}
          Input Text             ${SXP-INPUT}         100000
          Click Element          ${SEND-INPUT}
          Wait Until Page Contains Element        //button[normalize-space()='No']
          Click Element                           //button[normalize-space()='No']
          Input Text             ${SXP-INPUT}      31-12-2021
          Click Element          ${SEND-INPUT}
          Input Text             ${SXP-INPUT}      01-02-2022
          Click Element          ${SEND-INPUT}
          Wait Until Page Contains Element         //button[normalize-space()='Submit']
          Click Element                            //button[normalize-space()='Submit']
          Wait Until Page Contains Element       ${UPLOAD-DOCUMENT}
          Click Element                          ${UPLOAD-DOCUMENT}
          Wait Until Page Contains Element       ${UPLOAD-BUTTON}
          Click Element                          ${UPLOAD-BUTTON}
          Document Uploading               C:\\Users\\chaitanya.k\\Downloads\\policy
