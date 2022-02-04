*** Settings ***
Resource    ../Resources/corporateRes.robot
Library   SeleniumLibrary
*** Test Cases ***
Upload Policy
       Open Website
       Login User
       View all
       Upload Policy
       Choose File    locator    file_path