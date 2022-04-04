*** Settings ***
Resource    ../Resources/corporateRes.robot
Library    SeleniumLibrary
#Library    Selenium2Library

*** Variables ***
${H}          "section[class='column column-right task-details ng-scope'] div[class='three-cols-layout-cell content']"
${SUBMITTT}      //button[@name='data[submit]']

*** Test Cases ***
open camunda
         Open Camunda
         Execute javaScript       document.querySelector("section[class='column column-right task-details ng-scope'] div[class='three-cols-layout-cell content']").scrollTop=500

#         Wait Until Page Contains Element     //span[@class='glyphicon glyphicon-resize-full']
#         Click Element            //span[@class='glyphicon glyphicon-resize-full']
#          Sleep    2s
##          Execute Javascript     document.querySelector("section[class='column column-right task-details ng-scope'] div[class='three-cols-layout-cell content']").scrollTop=500;
#            Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#             Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#         Scroll Element Into View      //div[@class='tab-content']

#           Wait Until Page Contains Element    //input[@id='username']
#           Input Text   //input[@id='username']    tejaswini
#           Input Text   //input[@id='password']    test
#           Click Element    //input[@id='kc-login']
#           Sleep    2s
#           Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#           Scroll Element Into View      //a[@class='MuiButtonBase-root MuiButton-root MuiButton-text sc-furwcr gwElhm active']//span[@class='sc-gKclnd jsBQKr']//*[name()='svg']
#           Click Element           //*[@id="root"]/div/div[2]/div[1]/div/div/div/ul/div[10]/div/a/span[1]/span/svg
#           Click Element         //html/body/div/div/div[2]/div[1]/div/div/div/ul/div[5]/div/a/span[1]
#         Execute Javascript    $(document).scrollTop(${3000})
