*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Library           BuiltIn
Library           String
Library           Collections

*** Variables ***
${MESSAGE}        Hello, World

*** Test Cases ***
Testcase1
    OpenBrowser    http://google.co.in    chrome    # Google urls
    sleep    5s
    Maximize Browser Window
    Close Browser

Testcase2
    [Tags]    smoke    sanity
    Log    ${MESSAGE}
    CheckMessage    ${MESSAGE}
    : FOR    ${INDEX}    IN RANGE    1    10
    \    Log    ${INDEX}
    \    ${RANDOM_STRING}=    Generate Random String    ${INDEX}
    \    Log    ${RANDOM_STRING}
    @{ITEMS}    Create List    Good Element 1    Break On Me    Good Element 2
    : FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    Run Keyword If    '${ELEMENT}' == 'Break On Me'    Exit For Loop
    \    Log    Do more actions here ...
    ${Some_value}=    set variable    "one two three"
    @{words}    Split String    ${Some_value}    ${SPACE}
    :FOR    ${value}    IN RANGE    0    3
    \    ${text}=    Get From List    ${words}    ${value}
    \    Log    ${text}

*** Keywords ***
CheckMessage
    [Arguments]    ${MSG}
    should be equAL    ${MSG}    Hello, World
