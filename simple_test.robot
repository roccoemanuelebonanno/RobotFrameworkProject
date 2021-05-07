*** Settings ***
Resource    ./config.robot


Test Teardown  Close Browser

*** Test Cases ***
Simple Search 
        [Tags]   Smoke-simple-test

        Open Browser    ${HOME_URL}  browser=${BROWSER}  options=binary_location="/usr/local/bin/chromedriver"


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
