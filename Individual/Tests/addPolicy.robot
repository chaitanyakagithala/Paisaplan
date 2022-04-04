*** Settings ***
Resource    ../Resources/corporateRes.robot
Library      SeleniumLibrary



*** Test Cases ***
Add Policy
      Open Website
      Login User
      ${item-on-page} =   Get Element Count   ${Add-An-First-Existing-Policy}
      Run Keyword If  ${item-on-page} > 0  Add First Policy
      ...  ELSE   Add Further more Polices
      Wait Until Page Contains Element   ${PROCEED}
      Click Element                      ${PROCEED}
      Wait Until Page Contains Element   ${Simply-Upload-Policy}
      Click Element                      ${Simply-Upload-Policy}
      Sleep   1s
      Upload File
      Wait Until Page Contains Element     ${No}
      Click element                        ${No}
      Wait Until Page Contains Element   //html/body/div[4]/div[2]/div[2]/div[10]/p/a
      Click Element                      //html/body/div[4]/div[2]/div[2]/div[10]/p/a


