*** Settings ***
Library  SeleniumLibrary
Suite Setup    Launch Browser and Login to Salesforce
Suite Teardown    Close All Browsers

*** Keywords ***
Launch Browser and Login to Salesforce   
    Open Browser     ${url}     ${browser}    --disable-popup-blocking
    Maximize Browser Window
    Input Text    css:input#username    lalchand.rupali@salesforce.com
    Input Text    css:input#password    Lalchand@123
    Click Button    css:input#Login
    Sleep    5s


*** Variables ***
${browser}      chrome
${url}      https://decisivedgetechnology-dev-ed.my.salesforce.com/
&{USER_DETAILS}    fname=Arbaj  lname=Khan  password=demo123    email=test@example.com

*** Test Cases ***
Verify Login to Salesforce
    [Documentation]    This test case verifies login functionality to Salesforce.
    ${location}=        Get Location
    log to console       ${location}
    ${title}=        Get Window Titles  
    log to console       ${title}

Verify Lead creation
    [Documentation]    This test case verifies lead creation functionality in Salesforce.
    Sleep    5s
    Click Element    //button[@title='App Launcher']
    Sleep    3s
    Click Element    //p[text()='Sales Console']
    Sleep    3s
    Click Element    //button[@aria-label='Show Navigation Menu']
    Click Element    //a[@data-itemid='Lead']
    Sleep    2s
    Click Element    //a[@title='New']
    Sleep    2s
    Input Text    //input[@name='firstName']    ${USER_DETAILS.fname}
    Input Text    //input[@name='lastName']    ${USER_DETAILS.lname}
    Input Text    //input[@name='Company']    Decisive Edge Technology
    Input Text    //input[@name='MobilePhone']     998989881
    Click Button       //button[@name='SaveEdit']
    Sleep    3s
   # Click Element    //a[@id='detailTab__item']
    ${result}    Get Text    //lightning-formatted-name[text()='${USER_DETAILS.fname} ${USER_DETAILS.lname}']
    Should Be Equal    ${result}    ${USER_DETAILS.fname} ${USER_DETAILS.lname}