*** Settings ***
Resource    ../Resources/corporateRes.robot
Library  SeleniumLibrary

*** Test Cases ***
Add Annexutre
       Open Website
       Login User
       View all
       Add Annexure
