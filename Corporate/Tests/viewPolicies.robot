*** Settings ***
Resource    ../Resources/corporateRes.robot
Library         SeleniumLibrary
*** Test Cases ***
View Policies
       Open Website
       Login User
       View all