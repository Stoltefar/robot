*** Settings ***
Documentation  Some basic information about the whole test suite
Library  SeleniumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://www.mediamarkt.se

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize browser window

Go To Web Page
    Go To  ${URL}
    Wait until page contains  Om MediaMarkt
Search for product
    [Arguments]  ${search_term}  ${search_result}
    Enter Search Term  ${search_term}
    Submit Search
    Verify Search Completed  ${search_result}

Enter Search Term
    [Arguments]  ${search_term}
        input text  //*[@id="search-autocomplete"]/form/input[1]  ${search_term}
Submit search
        Press Keys  //*[@id="search-autocomplete"]/form/input[1]  RETURN
Verify Search Completed
    [Arguments]  ${search_result}
        Wait until Page COntains  ${search_result}

End Web Test
    Close Browser

*** Test Cases ***
User can access Website And Search For Product
    [Documentation]  This is some information about the test
    [Tags]  Test 1
    Go To Web Page

User can Search For A Product
    [Documentation]  This is some basic info about the second test
    [Tags]  Test 2
    Go To Web Page
    Search for product  Game & Watch: Legend of Zelda  Game & Watch: Legend of Zelda

User can search for another product
    [Documentation]  Info about he third test case
    [Tags]  Test 3
    Go To Web Page
    Search for product  NINTENDO Switch 2019 - Grå  NINTENDO Switch 2019 - Grå
