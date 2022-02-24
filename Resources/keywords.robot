*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize browser window

Go To Web Page
    Go To  ${URL}
    Verify Page Loaded

Verify Page Loaded
    Wait until page contains  Om MediaMarkt
Search for product
    [Arguments]  ${search_term}
    Enter Search Term  ${search_term}
    Submit Search
    Verify Search Completed

Enter Search Term
    [Arguments]  ${search_term}
        input text  //*[@id="search-autocomplete"]/form/input[1]  ${search_term}
Submit search
        Press Keys  //*[@id="search-autocomplete"]/form/input[1]  RETURN
Verify Search Completed
        Wait Until Page Contains Element  //*[@id="category"]/hgroup/h1/em
        ${element_text}  Get Text  //*[@id="category"]/hgroup/h1/em
        ${actual_amount}  convert into number  ${element_text}
        Should be True  ${actual_amount} > 0

End Web Test
    Close Browser
