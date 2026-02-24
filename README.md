# Linux System Setup Tool

This project provides an automated bash script to streamline the installation of essential development tools and software on a fresh Linux (Ubuntu/Debian-based) machine.

## 🚀 Overview

The `setup.sh` script automates the installation of Node.js environments, web browsers, and specialized IDEs, reducing manual configuration time.

## 📦 Tools Included

1.  **System Essentials**: `curl`, `wget`, `git`, `build-essential`.
2.  **NVM (Node Version Manager)**: For managing multiple Node.js versions.
3.  **Node.js (LTS)**: The latest Long-Term Support version.
4.  **Google Chrome**: Stable version for web development and browsing.
5.  **Gemini CLI**: Interactive AI-driven command-line assistant.
6.  **Google Antigravity IDE**: A specialized internal IDE for advanced development workflows.

## 🛠️ Usage

### 1. Clone the repository (if not already local)
```bash
git clone <repository-url>
cd setup-tool-new-machine
```

### 2. Make the script executable
```bash
chmod +x setup.sh
```

### 3. Run the setup script
```bash
./setup.sh
```

> **Note**: You will be prompted for your `sudo` password to install system packages.

### 4. Apply Changes
After the script completes, restart your terminal or run:
```bash
source ~/.bashrc
```

## ⚠️ Important Considerations
- This script is designed for **Ubuntu/Debian** distributions.
- It will automatically update your system packages (`apt update && apt upgrade`).
- Ensure you have a stable internet connection before running.

## 📜 License
[Specify License, e.g., MIT]
