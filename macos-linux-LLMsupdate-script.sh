#!/bin/bash

# AI Tools Updater for macOS and Linux
# Created by H190K
# GitHub: https://github.com/H190K/terminalLLMsupdate-script

# Set npm optimization flags for faster operations
NPM_FLAGS="--quiet --no-audit --no-fund"

# Check if Node.js is installed
if ! command -v npm &> /dev/null; then
    clear
    echo "================================================"
    echo "          AI CODING TOOLS UPDATER"
    echo "================================================"
    echo ""
    echo "[ERROR] Node.js is not installed on your system!"
    echo ""
    echo "This script requires Node.js and npm to function."
    echo "Please download and install Node.js from:"
    echo ""
    echo "https://nodejs.org/"
    echo ""
    echo "After installing Node.js, restart your terminal"
    echo "and run this script again."
    echo ""
    echo "================================================"
    echo ""
    read -p "Press Enter to close: "
    exit 1
fi

CHECK_AND_INSTALL() {
    local package_name=$1
    local display_name=$2

    # Check if package is installed globally using npm list
    # This is more reliable than checking directories directly
    if ! npm list -g "$package_name" --depth=0 &> /dev/null; then
        echo ""
        echo "[WARNING] $display_name is not installed!"
        echo ""
        read -p "Do you want to install $display_name now? (y/n): " install_choice
        if [[ "$install_choice" =~ ^[Yy]$ ]]; then
            echo "Installing $display_name..."
            npm install -g "$package_name" $NPM_FLAGS --force
            local install_error=$?
            if [ $install_error -eq 0 ]; then
                echo "[SUCCESS] $display_name installed successfully!"
            else
                echo "[ERROR] Failed to install $display_name - Error Code: $install_error"
                pause
                return 1
            fi
        else
            echo "Skipping $display_name..."
            pause
            return 1
        fi
    fi
    return 0
}

MAIN_MENU() {
    clear
    echo "================================================"
    echo "          AI CODING TOOLS UPDATER"
    echo "================================================"
    echo ""
    echo "Select an option:"
    echo ""
    echo "  [1] Update Claude Code"
    echo "  [2] Update Gemini CLI"
    echo "  [3] Update OpenAI CLI"
    echo "  [4] Update OpenCode"
    echo "  [5] Update ALL tools"
    echo "  [6] Choose multiple tools"
    echo "  [0] Exit"
    echo ""
    echo "================================================"
    echo ""
    echo "  Created by H190K"
    echo "  GitHub: https://github.com/H190K/terminalLLMsupdate-script"
    echo ""
    read -p "Enter your choice (0-6): " choice

    case $choice in
        0) EXIT ;;
        1) UPDATE_CLAUDE ;;
        2) UPDATE_GEMINI ;;
        3) UPDATE_OPENAI ;;
        4) UPDATE_OPENCODE ;;
        5) UPDATE_ALL ;;
        6) MULTI_SELECT ;;
        *) echo "Invalid choice! Try again."; pause; MAIN_MENU ;;
    esac
}

UPDATE_CLAUDE() {
    clear
    echo "================================================"
    echo "        UPDATING CLAUDE CODE"
    echo "================================================"
    echo ""
    CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
    if [ $? -ne 0 ]; then
        MAIN_MENU
        return
    fi
    echo ""
    npm update -g @anthropic-ai/claude-code $NPM_FLAGS
    claude_error=$?
    echo ""
    if [ $claude_error -eq 0 ]; then
        echo "[SUCCESS] Claude Code updated successfully!"
    else
        echo "[ERROR] Failed to update Claude Code - Error Code: $claude_error"
    fi
    echo ""
    pause
    MAIN_MENU
}

UPDATE_GEMINI() {
    clear
    echo "================================================"
    echo "        UPDATING GEMINI CLI"
    echo "================================================"
    echo ""
    CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
    if [ $? -ne 0 ]; then
        MAIN_MENU
        return
    fi
    echo ""
    npm update -g @google/gemini-cli $NPM_FLAGS
    gemini_error=$?
    echo ""
    if [ $gemini_error -eq 0 ]; then
        echo "[SUCCESS] Gemini CLI updated successfully!"
    else
        echo "[ERROR] Failed to update Gemini CLI - Error Code: $gemini_error"
    fi
    echo ""
    pause
    MAIN_MENU
}

UPDATE_OPENAI() {
    clear
    echo "================================================"
    echo "        UPDATING OPENAI CLI"
    echo "================================================"
    echo ""
    CHECK_AND_INSTALL "openai" "OpenAI CLI"
    if [ $? -ne 0 ]; then
        MAIN_MENU
        return
    fi
    echo ""
    npm update -g openai $NPM_FLAGS
    openai_error=$?
    echo ""
    if [ $openai_error -eq 0 ]; then
        echo "[SUCCESS] OpenAI CLI updated successfully!"
    else
        echo "[ERROR] Failed to update OpenAI CLI - Error Code: $openai_error"
    fi
    echo ""
    pause
    MAIN_MENU
}

UPDATE_OPENCODE() {
    clear
    echo "================================================"
    echo "        UPDATING OPENCODE"
    echo "================================================"
    echo ""
    CHECK_AND_INSTALL "opencode-ai" "OpenCode"
    if [ $? -ne 0 ]; then
        MAIN_MENU
        return
    fi
    echo ""
    npm update -g opencode-ai $NPM_FLAGS
    opencode_error=$?
    echo ""
    if [ $opencode_error -eq 0 ]; then
        echo "[SUCCESS] OpenCode updated successfully!"
    else
        echo "[ERROR] Failed to update OpenCode - Error Code: $opencode_error"
    fi
    echo ""
    pause
    MAIN_MENU
}

UPDATE_ALL() {
    clear
    echo "================================================"
    echo "        UPDATING ALL TOOLS"
    echo "================================================"
    echo ""

    echo "[1/4] Updating Claude Code..."
    echo "------------------------------------------------"
    CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
    if [ $? -eq 0 ]; then
        npm update -g @anthropic-ai/claude-code $NPM_FLAGS
        claude_error=$?
        if [ $claude_error -eq 0 ]; then
            echo "[SUCCESS] Claude Code updated successfully!"
        else
            echo "[ERROR] Failed to update Claude Code - Error Code: $claude_error"
        fi
    else
        claude_error=1
        echo "[SKIPPED] Claude Code was not installed."
    fi
    echo ""

    echo "[2/4] Updating Gemini CLI..."
    echo "------------------------------------------------"
    CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
    if [ $? -eq 0 ]; then
        npm update -g @google/gemini-cli $NPM_FLAGS
        gemini_error=$?
        if [ $gemini_error -eq 0 ]; then
            echo "[SUCCESS] Gemini CLI updated successfully!"
        else
            echo "[ERROR] Failed to update Gemini CLI - Error Code: $gemini_error"
        fi
    else
        gemini_error=1
        echo "[SKIPPED] Gemini CLI was not installed."
    fi
    echo ""

    echo "[3/4] Updating OpenAI CLI..."
    echo "------------------------------------------------"
    CHECK_AND_INSTALL "openai" "OpenAI CLI"
    if [ $? -eq 0 ]; then
        npm update -g openai $NPM_FLAGS
        openai_error=$?
        if [ $openai_error -eq 0 ]; then
            echo "[SUCCESS] OpenAI CLI updated successfully!"
        else
            echo "[ERROR] Failed to update OpenAI CLI - Error Code: $openai_error"
        fi
    else
        openai_error=1
        echo "[SKIPPED] OpenAI CLI was not installed."
    fi
    echo ""

    echo "[4/4] Updating OpenCode..."
    echo "------------------------------------------------"
    CHECK_AND_INSTALL "opencode-ai" "OpenCode"
    if [ $? -eq 0 ]; then
        npm update -g opencode-ai $NPM_FLAGS
        opencode_error=$?
        if [ $opencode_error -eq 0 ]; then
            echo "[SUCCESS] OpenCode updated successfully!"
        else
            echo "[ERROR] Failed to update OpenCode - Error Code: $opencode_error"
        fi
    else
        opencode_error=1
        echo "[SKIPPED] OpenCode was not installed."
    fi
    echo ""

    echo "================================================"
    echo "             UPDATE COMPLETE!"
    echo "================================================"
    echo ""
    echo "Summary:"
    [ $claude_error -eq 0 ] && echo "- Claude Code: UP TO DATE" || echo "- Claude Code: FAILED/SKIPPED"
    [ $gemini_error -eq 0 ] && echo "- Gemini CLI: UP TO DATE" || echo "- Gemini CLI: FAILED/SKIPPED"
    [ $openai_error -eq 0 ] && echo "- OpenAI CLI: UP TO DATE" || echo "- OpenAI CLI: FAILED/SKIPPED"
    [ $opencode_error -eq 0 ] && echo "- OpenCode: UP TO DATE" || echo "- OpenCode: FAILED/SKIPPED"
    echo ""
    pause
    MAIN_MENU
}

MULTI_SELECT() {
    clear
    echo "================================================"
    echo "        SELECT TOOLS TO UPDATE"
    echo "================================================"
    echo ""
    echo "Enter the numbers of the tools you want to update"
    echo "(separated by spaces, e.g., 1 3 for Claude + OpenAI):"
    echo ""
    echo "  [1] Claude Code"
    echo "  [2] Gemini CLI"
    echo "  [3] OpenAI CLI"
    echo "  [4] OpenCode"
    echo ""
    read -p "Your selection: " selections
    echo ""

    update_claude=0
    update_gemini=0
    update_openai=0
    update_opencode=0

    for i in $selections; do
        case $i in
            1) update_claude=1 ;;
            2) update_gemini=1 ;;
            3) update_openai=1 ;;
            4) update_opencode=1 ;;
        esac
    done

    clear
    echo "================================================"
    echo "        UPDATING SELECTED TOOLS"
    echo "================================================"
    echo ""

    if [ $update_claude -eq 1 ]; then
        echo "[1/?] Updating Claude Code..."
        echo "------------------------------------------------"
        CHECK_AND_INSTALL "@anthropic-ai/claude-code" "Claude Code"
        if [ $? -eq 0 ]; then
            npm update -g @anthropic-ai/claude-code $NPM_FLAGS
            claude_error=$?
            if [ $claude_error -eq 0 ]; then
                echo "[SUCCESS] Claude Code updated successfully!"
            else
                echo "[ERROR] Failed to update Claude Code - Error Code: $claude_error"
            fi
        else
            claude_error=1
            echo "[SKIPPED] Claude Code was not installed."
        fi
        echo ""
    fi

    if [ $update_gemini -eq 1 ]; then
        echo "[2/?] Updating Gemini CLI..."
        echo "------------------------------------------------"
        CHECK_AND_INSTALL "@google/gemini-cli" "Gemini CLI"
        if [ $? -eq 0 ]; then
            npm update -g @google/gemini-cli $NPM_FLAGS
            gemini_error=$?
            if [ $gemini_error -eq 0 ]; then
                echo "[SUCCESS] Gemini CLI updated successfully!"
            else
                echo "[ERROR] Failed to update Gemini CLI - Error Code: $gemini_error"
            fi
        else
            gemini_error=1
            echo "[SKIPPED] Gemini CLI was not installed."
        fi
        echo ""
    fi

    if [ $update_openai -eq 1 ]; then
        echo "[3/?] Updating OpenAI CLI..."
        echo "------------------------------------------------"
        CHECK_AND_INSTALL "openai" "OpenAI CLI"
        if [ $? -eq 0 ]; then
            npm update -g openai $NPM_FLAGS
            openai_error=$?
            if [ $openai_error -eq 0 ]; then
                echo "[SUCCESS] OpenAI CLI updated successfully!"
            else
                echo "[ERROR] Failed to update OpenAI CLI - Error Code: $openai_error"
            fi
        else
            openai_error=1
            echo "[SKIPPED] OpenAI CLI was not installed."
        fi
        echo ""
    fi

    if [ $update_opencode -eq 1 ]; then
        echo "[4/?] Updating OpenCode..."
        echo "------------------------------------------------"
        CHECK_AND_INSTALL "opencode-ai" "OpenCode"
        if [ $? -eq 0 ]; then
            npm update -g opencode-ai $NPM_FLAGS
            opencode_error=$?
            if [ $opencode_error -eq 0 ]; then
                echo "[SUCCESS] OpenCode updated successfully!"
            else
                echo "[ERROR] Failed to update OpenCode - Error Code: $opencode_error"
            fi
        else
            opencode_error=1
            echo "[SKIPPED] OpenCode was not installed."
        fi
        echo ""
    fi

    echo "================================================"
    echo "             UPDATE COMPLETE!"
    echo "================================================"
    echo ""
    echo "Summary:"
    if [ $update_claude -eq 1 ]; then
        [ $claude_error -eq 0 ] && echo "- Claude Code: UP TO DATE" || echo "- Claude Code: FAILED/SKIPPED"
    else
        echo "- Claude Code: SKIPPED"
    fi
    if [ $update_gemini -eq 1 ]; then
        [ $gemini_error -eq 0 ] && echo "- Gemini CLI: UP TO DATE" || echo "- Gemini CLI: FAILED/SKIPPED"
    else
        echo "- Gemini CLI: SKIPPED"
    fi
    if [ $update_openai -eq 1 ]; then
        [ $openai_error -eq 0 ] && echo "- OpenAI CLI: UP TO DATE" || echo "- OpenAI CLI: FAILED/SKIPPED"
    else
        echo "- OpenAI CLI: SKIPPED"
    fi
    if [ $update_opencode -eq 1 ]; then
        [ $opencode_error -eq 0 ] && echo "- OpenCode: UP TO DATE" || echo "- OpenCode: FAILED/SKIPPED"
    else
        echo "- OpenCode: SKIPPED"
    fi
    echo ""
    pause
    MAIN_MENU
}

EXIT() {
    clear
    echo "================================================"
    echo "        THANK YOU - GOODBYE!"
    echo "================================================"
    echo ""
    echo "  Created by H190K"
    echo "  GitHub: https://github.com/H190K/terminalLLMsupdate-script"
    echo ""
    read -p "Press Enter to close: "
    exit 0
}

pause() {
    read -p "Press Enter to continue..."
}

# Start the script
MAIN_MENU
