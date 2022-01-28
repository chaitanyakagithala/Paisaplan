*** Settings ***
Resource    ../Resources/corporateRes.robot
Library       SeleniumLibrary
*** Test Cases ***
Claim History
       Open Website
       Login User
       View all
       Claim History