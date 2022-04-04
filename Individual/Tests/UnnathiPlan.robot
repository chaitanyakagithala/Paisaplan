*** Settings ***
Resource    ../Resources/corporateRes.robot
Library  SeleniumLibrary
*** Test Cases ***
Renew History
        Open Website
        Login User
        Unnathi Plan