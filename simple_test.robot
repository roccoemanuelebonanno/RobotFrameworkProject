*** Settings ***
Resource    ./config.robot


Test Teardown  Close Browser

*** Test Cases ***
Simple Search 
        [Tags]   Smoke-simple-test

        ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${chrome_options}   add_argument    headless
        Call Method    ${chrome_options}   add_argument    disable-gpu
        ${options}=     Call Method     ${chrome_options}    to_capabilities      

        Open Browser    ${HOME_URL}  Chrome    desired_capabilities=${options}




        Wait Until Page Contains Element   xpath://body[contains(@class,'homepage')]    30
        Wait Until Element Is Visible      xpath://body[contains(@class,'homepage')]    30
        
        Wait Until Page Contains Element   id:inputSearch
        Wait Until Element Is Visible      id:inputSearch
        Click Element                      id:inputSearch
        Input Text                         id:inputSearch     Ken Follet    
        Press Keys                         id:inputSearch     ENTER

        Wait Until Location Contains       algolia-search
        
Test 
        Log to Console   "ciao"
