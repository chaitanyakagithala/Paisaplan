*** Settings ***
Resource    ../Resources/corporateRes.robot
Library     SeleniumLibrary
*** Test Cases ***
Adding Endorsement
        Open Website
        Login User
        View all
        Add Endorsement