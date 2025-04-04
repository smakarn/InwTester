*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}           chrome
${URL}              https://www.youtube.com
${SEARCH_TERM}      Mum Memories
${SCREENSHOT_PATH}  /Users/karn.u/YouTube_Automation/screenshots/youtube_video.png

*** Test Cases ***
Search, Open Channel, Play Video and Capture Screenshot
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s

    # ค้นหาช่อง YouTube
    Input Text    name=search_query    ${SEARCH_TERM}
    Press Keys    name=search_query    ENTER
    Sleep    2s

    # คลิกเข้าไปที่ช่องแรก
    Wait Until Element Is Visible    xpath=(//a[@id="main-link"])[1]    timeout=5s
    Click Element    xpath=(//a[@id="main-link"])[1]
    Sleep    1s

    # คลิกแท็บ "Home" เพื่อไปยังหน้าแรก
    Click Element    xpath=//*[@id="tabsContent"]/yt-tab-group-shape/div[1]/yt-tab-shape[1]/div[1]
    Sleep    1s

    # คลิกเมนู "Videos"
    Wait Until Element Is Visible    xpath=//*[@id="tabsContent"]/yt-tab-group-shape/div[1]/yt-tab-shape[2]/div[1]    timeout=5s
    Click Element    xpath=//*[@id="tabsContent"]/yt-tab-group-shape/div[1]/yt-tab-shape[2]/div[1]
    Sleep    1s

    # คลิกแท็บ "ยอดนิยม" จากเมนู "Videos"
    Wait Until Element Is Visible    xpath=//yt-formatted-string[text()="Popular"]    timeout=5s
    Click Element    xpath=//yt-formatted-string[text()="Popular"]
    Sleep    1s

    # เลือกเล่นวิดีโอแรกในแท็บ "ยอดนิยม"
    Wait Until Element Is Visible    xpath=//*[@id="contents"]/ytd-rich-item-renderer[1]    timeout=5s
    Click Element    xpath=//*[@id="contents"]/ytd-rich-item-renderer[1]
    Sleep    2s  # รอให้วิดีโอเริ่มเล่น

    # ตรวจสอบว่ามีปุ่มข้ามโฆษณาหรือไม่
    ${skip_ad} =    Run Keyword And Return Status    Element Should Be Visible    xpath=//button[contains(@class, 'ytp-ad-skip-button')]

    Run Keyword If    ${skip_ad}    Click Element    xpath=//button[contains(@class, 'ytp-ad-skip-button')]
    Run Keyword Unless    ${skip_ad}    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'ytp-ad-player-overlay')]    timeout=30s

    # กดปุ่ม Full Screen หลังจากโฆษณาจบ
    Press Keys    None    f  
    Sleep    10s

    # แคปหน้าจอวิดีโอที่กำลังเล่น
    Capture Page Screenshot    ${SCREENSHOT_PATH}

    # ตรวจสอบว่ารูปถูกบันทึก
    File Should Exist    ${SCREENSHOT_PATH}

    # กดปุ่ม ออกจาก Full Screen
    Press Keys    None    escape  # กด "escape" เพื่อออกจาก Full Screen
    Sleep    2s

    # ปิด Browser
    Close Browser
