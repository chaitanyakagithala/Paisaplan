*** Settings ***
Resource    ../Resources/corporateRes.robot
Library       SeleniumLibrary
*** Test Cases ***
Login User
       Open Website
       Login User

