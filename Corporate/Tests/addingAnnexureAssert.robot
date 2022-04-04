*** Settings ***
Resource    ../Resources/corporateRes.robot
Library  SeleniumLibrary

*** Test Cases ***
Add Annexutre
       Open Website
       Login User
       View all
       Policy Tile Assert
       Sleep    1s
       Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
       ${item-on-page} =   Get Element Count   //a[normalize-space()='Update Asset']
       Run Keyword If  ${item-on-page} > 0  Update Assert
       ...  ELSE   Upload Fresh Assert
