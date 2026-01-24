# 🤖 Terminal AI LLMs Updater Script

> A simple, interactive terminal script to keep all your AI coding CLI tools up to date across Windows, macOS, and Linux.

---

## 😏 About This Script

A 50-line wrapper around `npm update` that I spent more time writing the README for than the actual code. You definitely need this instead of just typing those commands yourself.

Remember when you needed to update 4 packages and it took like 30 seconds? Tragic. Now it only takes 28 seconds with this completely unnecessary script. You're welcome, I guess?

---

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)](https://github.com/H190K/terminalLLMsupdate-script)

## 📋 Features

- **One-click updates** for all popular AI coding CLI tools
- **Interactive menu** system for easy navigation
- **Selective updates** - update one tool, multiple tools, or all at once
- **Cross-platform support** - Works on Windows, macOS, and Linux
- **Safe updates** - Preserves all your custom settings and API keys
- **Clear feedback** - Success/error messages for each update
- **Node.js detection** - Automatically checks if Node.js is installed
- **Auto-install prompt** - Offers to install packages that aren't already installed

## 🚀 Supported Tools

| Tool | Description | Package |
|------|-------------|---------|
| **Claude Code** | Anthropic's Claude AI coding assistant | `@anthropic-ai/claude-code` |
| **Gemini CLI** | Google's Gemini AI CLI | `@google/gemini-cli` |
| **OpenAI CLI** | OpenAI's official CLI | `openai` |
| **OpenCode** | Open source AI coding tool | `opencode` |

## 📦 Installation

### Prerequisites

- **Node.js** and **npm** must be installed on your system
- Download from [nodejs.org](https://nodejs.org/)

### Windows

1. Download `windows-LLMsupdate-script.bat`
2. Place it anywhere on your computer
3. Double-click to run, or run from Command Prompt/PowerShell

### macOS / Linux

1. Download `macos-linux-LLMsupdate-script.sh`
2. Open terminal and navigate to the download location
3. Make the script executable:
   ```bash
   chmod +x macos-linux-LLMsupdate-script.sh
   ```
4. Run the script:
   ```bash
   ./macos-linux-LLMsupdate-script.sh
   ```

## 🎮 Usage

When you run the script, you'll see an interactive menu:

```
================================================
          AI CODING TOOLS UPDATER
================================================

Select an option:

  [1] Update Claude Code
  [2] Update Gemini CLI
  [3] Update OpenAI CLI
  [4] Update OpenCode
  [5] Update ALL tools
  [6] Choose multiple tools
  [0] Exit

================================================

  Created by H190K
  GitHub: https://github.com/H190K/terminalLLMsupdate-script

Enter your choice (0-6):
```

### Menu Options

| Option | Description |
|--------|-------------|
| **[1-4]** | Update a specific tool individually |
| **[5]** | Update all 4 tools in sequence |
| **[6]** | Select multiple tools to update (e.g., `1 3` for Claude + OpenAI) |
| **[0]** | Exit the script |

## ⚠️ Important Notes

### Your Settings Are Safe!

This script uses `npm update -g` which **only updates the program files**. Your custom settings are preserved:

- ✅ API keys stored in config files
- ✅ Environment variables
- ✅ User preferences and settings
- ✅ Custom configurations

### Node.js Detection

The script automatically checks if Node.js/npm is installed on startup. If not found, it will:
- Display a clear error message
- Provide a link to download Node.js from [nodejs.org](https://nodejs.org/)
- Instruct you to restart the terminal after installation

### Auto-Install Missing Packages

If you try to update a tool that isn't installed, the script will:
- Display a warning that the package is not installed
- Ask if you want to install it now (y/n)
- Install the package if you accept
- Skip the tool if you decline

### Update Errors

If an update fails, the script will:
- Display the error code
- Continue with other updates (if updating multiple tools)
- Show a summary at the end

Common reasons for update failures:
- Network connectivity issues
- Incorrect package name
- Permission issues (try running with elevated privileges)

## 📝 Examples

### Update All Tools
```
Enter your choice (0-6): 5
```

### Update Specific Tools
```
Enter your choice (0-6): 1
```

### Update Multiple Tools
```
Enter your choice (0-6): 6

Your selection: 1 3 4
```

## 🛠️ Troubleshooting

### "npm: command not found" or Node.js not detected
- The script will automatically detect if Node.js is missing
- Install Node.js from [nodejs.org](https://nodejs.org/)
- Restart your terminal after installation

### Permission Denied (macOS/Linux)
```bash
chmod +x macos-linux-LLMsupdate-script.sh
```

### Package Not Installed
- The script now offers to install missing packages automatically
- Simply accept the prompt when asked if you want to install
- You can also install manually:
  ```bash
  npm install -g @anthropic-ai/claude-code
  npm install -g @google/gemini-cli
  npm install -g openai
  npm install -g opencode
  ```

## 📄 License


This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Created by H190K**

- GitHub: [@H190K](https://github.com/H190K)
- Repository: [terminalLLMsupdate-script](https://github.com/H190K/terminalLLMsupdate-script)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📢 Show Your Support

- ⭐ Star this repository
- 🐛 Report bugs via [Issues](https://github.com/H190K/terminalLLMsupdate-script/issues)
- 💡 Suggest new features
- 🔄 Share with others who might find it useful

## 💖 Support the Project

Love this project? Here's how you can help:

* ⭐ **Star the repo** to show your support
* 🍴 **Fork it** and extend the features
* 🐛 **Report bugs** or suggest improvements via GitHub Issues
* 📢 **Share it** with developers who need this tool
* 💬 **Join discussions** and help other users

---

If my projects make your life easier, consider supporting development. Your support helps me create more open-source tools for the community.

<div align="center">

[![Fiat Donation](https://img.shields.io/badge/💵_Fiat_Donation-H190K/Sindipay-ff7a18?style=for-the-badge&logo=creditcard&logoColor=white)](https://donation.h190k.com/)

[![Crypto Donations](https://img.shields.io/badge/Crypto_Donations-NOWPayments-9B59B6?style=for-the-badge&logo=bitcoin&logoColor=colored)](https://nowpayments.io/donation?api_key=J0QACAH-BTH4F4F-QDXM4ZS-RCA58BH)

</div>

<div align="center">

Made with ❤️ by H190K

</div>
