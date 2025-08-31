*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Handle Browser Windows
    Open Browser     http://login.saleforce.com    chrome
    Maximize Browser Window
    ${location}=        Get Location
    log to console       ${location}


    Go To     https://www.selenium.dev/selenium/docs/api/java/index
   ${location}=        Get Location
    log to console       ${location}

    Go Back