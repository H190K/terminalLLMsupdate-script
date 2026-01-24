@echo off
REM AI Tools Updater for Windows
REM Created by H190K
REM GitHub: https://github.com/H190K/terminalLLMsupdate-script

setlocal enabledelayedexpansion
title AI Tools Updater

REM Check if Node.js is installed
where npm >nul 2>nul
if %errorlevel% neq 0 (
    cls
    echo ================================================
    echo           AI CODING TOOLS UPDATER
    echo ================================================
    echo.
    echo [ERROR] Node.js is not installed on your system!
    echo.
    echo This script requires Node.js and npm to function.
    echo Please download and install Node.js from:
    echo.
    echo https://nodejs.org/
    echo.
    echo After installing Node.js, restart your terminal
    echo and run this script again.
    echo.
    echo ================================================
    echo.
    set /p dummy="Press Enter to close: "
    exit /b 1
)

:MAIN_MENU
cls
echo ================================================
echo           AI CODING TOOLS UPDATER
echo ================================================
echo.
echo Select an option:
echo.
echo   [1] Update Claude Code
echo   [2] Update Gemini CLI
echo   [3] Update OpenAI CLI
echo   [4] Update OpenCode
echo   [5] Update ALL tools
echo   [6] Choose multiple tools
echo   [0] Exit
echo.
echo ================================================
echo.
echo   Created by H190K
echo   GitHub: https://github.com/H190K/terminalLLMsupdate-script
echo.
set /p choice="Enter your choice (0-6): "

if "%choice%"=="0" goto :EXIT
if "%choice%"=="1" goto :UPDATE_CLAUDE
if "%choice%"=="2" goto :UPDATE_GEMINI
if "%choice%"=="3" goto :UPDATE_OPENAI
if "%choice%"=="4" goto :UPDATE_OPENCODE
if "%choice%"=="5" goto :UPDATE_ALL
if "%choice%"=="6" goto :MULTI_SELECT
echo Invalid choice! Try again.
pause
goto :MAIN_MENU

:CHECK_AND_INSTALL
set package_name=%~1
set display_name=%~2
npm list -g %package_name% >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [WARNING] %display_name% is not installed!
    echo.
    set /p install_choice="Do you want to install %display_name% now? (y/n): "
    if /i "!install_choice!"=="y" (
        echo Installing %display_name%...
        call npm install -g %package_name%
        set install_error=!errorlevel!
        if !install_error! equ 0 (
            echo [SUCCESS] %display_name% installed successfully!
        ) else (
            echo [ERROR] Failed to install %display_name% - Error Code: !install_error!
            set /p dummy="Press Enter to continue..."
            exit /b 1
        )
    ) else (
        echo Skipping %display_name%...
        set /p dummy="Press Enter to continue..."
        exit /b 1
    )
)
exit /b 0

:UPDATE_CLAUDE
cls
echo ================================================
echo         UPDATING CLAUDE CODE
echo ================================================
echo.
call :CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
if %errorlevel% neq 0 goto :MAIN_MENU
echo.
call npm update -g @anthropic-ai/claude-code
set claude_error=!errorlevel!
echo.
if !claude_error! equ 0 (
    echo [SUCCESS] Claude Code updated successfully!
) else (
    echo [ERROR] Failed to update Claude Code - Error Code: !claude_error!
)
echo.
pause
goto :MAIN_MENU

:UPDATE_GEMINI
cls
echo ================================================
echo         UPDATING GEMINI CLI
echo ================================================
echo.
call :CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
if %errorlevel% neq 0 goto :MAIN_MENU
echo.
call npm update -g @google/gemini-cli
set gemini_error=!errorlevel!
echo.
if !gemini_error! equ 0 (
    echo [SUCCESS] Gemini CLI updated successfully!
) else (
    echo [ERROR] Failed to update Gemini CLI - Error Code: !gemini_error!
)
echo.
pause
goto :MAIN_MENU

:UPDATE_OPENAI
cls
echo ================================================
echo         UPDATING OPENAI CLI
echo ================================================
echo.
call :CHECK_AND_INSTALL "openai" "OpenAI CLI"
if %errorlevel% neq 0 goto :MAIN_MENU
echo.
call npm update -g openai
set openai_error=!errorlevel!
echo.
if !openai_error! equ 0 (
    echo [SUCCESS] OpenAI CLI updated successfully!
) else (
    echo [ERROR] Failed to update OpenAI CLI - Error Code: !openai_error!
)
echo.
pause
goto :MAIN_MENU

:UPDATE_OPENCODE
cls
echo ================================================
echo         UPDATING OPENCODE
echo ================================================
echo.
call :CHECK_AND_INSTALL "opencode" "OpenCode"
if %errorlevel% neq 0 goto :MAIN_MENU
echo.
call npm update -g opencode
set opencode_error=!errorlevel!
echo.
if !opencode_error! equ 0 (
    echo [SUCCESS] OpenCode updated successfully!
) else (
    echo [ERROR] Failed to update OpenCode - Error Code: !opencode_error!
)
echo.
pause
goto :MAIN_MENU

:UPDATE_ALL
cls
echo ================================================
echo         UPDATING ALL TOOLS
echo ================================================
echo.

echo [1/4] Updating Claude Code...
echo ------------------------------------------------
call :CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
if %errorlevel% equ 0 (
    call npm update -g @anthropic-ai/claude-code
    set claude_error=!errorlevel!
    if !claude_error! equ 0 (
        echo [SUCCESS] Claude Code updated successfully!
    ) else (
        echo [ERROR] Failed to update Claude Code - Error Code: !claude_error!
    )
) else (
    set claude_error=1
    echo [SKIPPED] Claude Code was not installed.
)
echo.

echo [2/4] Updating Gemini CLI...
echo ------------------------------------------------
call :CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
if %errorlevel% equ 0 (
    call npm update -g @google/gemini-cli
    set gemini_error=!errorlevel!
    if !gemini_error! equ 0 (
        echo [SUCCESS] Gemini CLI updated successfully!
    ) else (
        echo [ERROR] Failed to update Gemini CLI - Error Code: !gemini_error!
    )
) else (
    set gemini_error=1
    echo [SKIPPED] Gemini CLI was not installed.
)
echo.

echo [3/4] Updating OpenAI CLI...
echo ------------------------------------------------
call :CHECK_AND_INSTALL "openai" "OpenAI CLI"
if %errorlevel% equ 0 (
    call npm update -g openai
    set openai_error=!errorlevel!
    if !openai_error! equ 0 (
        echo [SUCCESS] OpenAI CLI updated successfully!
    ) else (
        echo [ERROR] Failed to update OpenAI CLI - Error Code: !openai_error!
    )
) else (
    set openai_error=1
    echo [SKIPPED] OpenAI CLI was not installed.
)
echo.

echo [4/4] Updating OpenCode...
echo ------------------------------------------------
call :CHECK_AND_INSTALL "opencode" "OpenCode"
if %errorlevel% equ 0 (
    call npm update -g opencode
    set opencode_error=!errorlevel!
    if !opencode_error! equ 0 (
        echo [SUCCESS] OpenCode updated successfully!
    ) else (
        echo [ERROR] Failed to update OpenCode - Error Code: !opencode_error!
    )
) else (
    set opencode_error=1
    echo [SKIPPED] OpenCode was not installed.
)
echo.

echo ================================================
echo              UPDATE COMPLETE!
echo ================================================
echo.
echo Summary:
if !claude_error! equ 0 (echo - Claude Code: UP TO DATE) else (echo - Claude Code: FAILED/SKIPPED)
if !gemini_error! equ 0 (echo - Gemini CLI: UP TO DATE) else (echo - Gemini CLI: FAILED/SKIPPED)
if !openai_error! equ 0 (echo - OpenAI CLI: UP TO DATE) else (echo - OpenAI CLI: FAILED/SKIPPED)
if !opencode_error! equ 0 (echo - OpenCode: UP TO DATE) else (echo - OpenCode: FAILED/SKIPPED)
echo.
pause
goto :MAIN_MENU

:MULTI_SELECT
cls
echo ================================================
echo         SELECT TOOLS TO UPDATE
echo ================================================
echo.
echo Enter the numbers of the tools you want to update
echo (separated by spaces, e.g., 1 3 for Claude + OpenAI):
echo.
echo   [1] Claude Code
echo   [2] Gemini CLI
echo   [3] OpenAI CLI
echo   [4] OpenCode
echo.
set /p selections="Your selection: "
echo.

set update_claude=0
set update_gemini=0
set update_openai=0
set update_opencode=0

for %%i in (%selections%) do (
    if "%%i"=="1" set update_claude=1
    if "%%i"=="2" set update_gemini=1
    if "%%i"=="3" set update_openai=1
    if "%%i"=="4" set update_opencode=1
)

cls
echo ================================================
echo         UPDATING SELECTED TOOLS
echo ================================================
echo.

if !update_claude! equ 1 (
    echo [1/?] Updating Claude Code...
    echo ------------------------------------------------
    call :CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
    if %errorlevel% equ 0 (
        call npm update -g @anthropic-ai/claude-code
        set claude_error=!errorlevel!
        if !claude_error! equ 0 (
            echo [SUCCESS] Claude Code updated successfully!
        ) else (
            echo [ERROR] Failed to update Claude Code - Error Code: !claude_error!
        )
    ) else (
        set claude_error=1
        echo [SKIPPED] Claude Code was not installed.
    )
    echo.
)

if !update_gemini! equ 1 (
    echo [2/?] Updating Gemini CLI...
    echo ------------------------------------------------
    call :CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
    if %errorlevel% equ 0 (
        call npm update -g @google/gemini-cli
        set gemini_error=!errorlevel!
        if !gemini_error! equ 0 (
            echo [SUCCESS] Gemini CLI updated successfully!
        ) else (
            echo [ERROR] Failed to update Gemini CLI - Error Code: !gemini_error!
        )
    ) else (
        set gemini_error=1
        echo [SKIPPED] Gemini CLI was not installed.
    )
    echo.
)

if !update_openai! equ 1 (
    echo [3/?] Updating OpenAI CLI...
    echo ------------------------------------------------
    call :CHECK_AND_INSTALL "openai" "OpenAI CLI"
    if %errorlevel% equ 0 (
        call npm update -g openai
        set openai_error=!errorlevel!
        if !openai_error! equ 0 (
            echo [SUCCESS] OpenAI CLI updated successfully!
        ) else (
            echo [ERROR] Failed to update OpenAI CLI - Error Code: !openai_error!
        )
    ) else (
        set openai_error=1
        echo [SKIPPED] OpenAI CLI was not installed.
    )
    echo.
)

if !update_opencode! equ 1 (
    echo [4/?] Updating OpenCode...
    echo ------------------------------------------------
    call :CHECK_AND_INSTALL "opencode" "OpenCode"
    if %errorlevel% equ 0 (
        call npm update -g opencode
        set opencode_error=!errorlevel!
        if !opencode_error! equ 0 (
            echo [SUCCESS] OpenCode updated successfully!
        ) else (
            echo [ERROR] Failed to update OpenCode - Error Code: !opencode_error!
        )
    ) else (
        set opencode_error=1
        echo [SKIPPED] OpenCode was not installed.
    )
    echo.
)

echo ================================================
echo              UPDATE COMPLETE!
echo ================================================
echo.
echo Summary:
if !update_claude! equ 1 (
    if !claude_error! equ 0 (echo - Claude Code: UP TO DATE) else (echo - Claude Code: FAILED/SKIPPED)
) else (
    echo - Claude Code: SKIPPED
)
if !update_gemini! equ 1 (
    if !gemini_error! equ 0 (echo - Gemini CLI: UP TO DATE) else (echo - Gemini CLI: FAILED/SKIPPED)
) else (
    echo - Gemini CLI: SKIPPED
)
if !update_openai! equ 1 (
    if !openai_error! equ 0 (echo - OpenAI CLI: UP TO DATE) else (echo - OpenAI CLI: FAILED/SKIPPED)
) else (
    echo - OpenAI CLI: SKIPPED
)
if !update_opencode! equ 1 (
    if !opencode_error! equ 0 (echo - OpenCode: UP TO DATE) else (echo - OpenCode: FAILED/SKIPPED)
) else (
    echo - OpenCode: SKIPPED
)
echo.
pause
goto :MAIN_MENU

:EXIT
cls
echo ================================================
echo         THANK YOU - GOODBYE!
echo ================================================
echo.
echo   Created by H190K
echo   GitHub: https://github.com/H190K/terminalLLMsupdate-script
echo.
set /p dummy="Press Enter to close: "
exit /b 0
