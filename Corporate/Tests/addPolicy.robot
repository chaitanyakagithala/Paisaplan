*** Settings ***
Resource    ../Resources/corporateRes.robot
Library      SeleniumLibrary
*** Test Cases ***
Add Policy
      Open Website
      Login User
      Wait Until Page Contains Element    ${ADD-AN-EXISTING-POLICY}
      Click Element                       ${ADD-AN-EXISTING-POLICY}
      Wait Until Page Contains Element    ${PROCEED}
      Click Element                       ${PROCEED}
      Wait Until Page Contains Element    ${UPLOAD-DOCUMENT}
      Click Element        ${UPLOAD-DOCUMENT}
      Upload File
#      Click Element        ${UPLOAD-BUTTON}
#      Document Uploading          C:\\Users\\chaitanya.k\\Downloads\\policy
