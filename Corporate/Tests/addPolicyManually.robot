*** Settings ***
Resource    ../Resources/corporateRes.robot
Library    SeleniumLibrary

*** Test Cases ***
Adding policy Manually
          Open Website
          Login User
          ${item-on-page} =   Get Element Count   ${Add-An-First-Existing-Policy}
          Run Keyword If  ${item-on-page} > 0  Add First Policy
#          ...  ELSE IF    ${item-on-page} == 0  Add First Policy
          ...  ELSE   Add Further more Polices
          Wait Until Page Contains Element    ${PROCEED}
          Click Element                       ${PROCEED}
          Wait Until Page Contains Element    ${ENTER-MANUALLY}
          Click Element          ${ENTER-MANUALLY}
          Sleep      1s
          Input Text        ${SXP-INPUT}          hdfc
          Click Element     ${SEND-INPUT}
          Wait Until Page Contains Element       //button[@value='HDFC ERGO General Insurance Co.Ltd.::14::GENERAL']
          Click Element                         //button[@value='HDFC ERGO General Insurance Co.Ltd.::14::GENERAL']
          Wait Until Page Contains Element      //button[@value='Property Insurance::19::General Insurance']
          Click Element                         //button[@value='Property Insurance::19::General Insurance']
          Wait Until Page Contains Element      //button[@value='Contractors All Risk ::Contractors All Risk']
          Click Element                         //button[@value='Contractors All Risk ::Contractors All Risk']
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
