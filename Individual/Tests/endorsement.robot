*** Settings ***
Resource    ../Resources/corporateRes.robot
Library     SeleniumLibrary
*** Test Cases ***
Adding Endorsement
        Open Website
        Login User
        View all
        Policy Tile Assert
        Wait Until Page Contains Element    ${EDORSEMENT}
        Click Element                       ${EDORSEMENT}
        sleep  1s
       ${count} =   Get Element Count  ${REQUEST-ENDORSEMENT}
       Run Keyword If  ${count} > 0  New endorsement
       ...  ELSE   Update endorsement
        Wait Until Page Contains Element   ${POLICY-CORRECTIONS}
        Click Element                       ${POLICY-CORRECTIONS}
        Wait Until Page Contains Element    //button[@value='UPLOADS']
        Click Element                       //button[@value='UPLOADS']
        Sleep  2s
        Add endrosement for policy corrections