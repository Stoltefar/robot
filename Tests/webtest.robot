*** Settings ***
Documentation  Some basic information about the whole test suite
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Library  ../Scripts/remove_parenthesis.py
Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://www.mediamarkt.se


*** Test Cases ***
User can access Website And Search For Product
    [Documentation]  This is some information about the test
    [Tags]  Test 1
    Go To Web Page

User can Search For A Product
    [Documentation]  This is some basic info about the second test
    [Tags]  Test 2
    Go To Web Page
    Search for product  Game & Watch

User can search for another product
    [Documentation]  Info about he third test case
    [Tags]  Test 3
    Go To Web Page
    Search for product  NINTENDO Switch
