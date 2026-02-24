#!/bin/bash

# Exit immediately if any command fails
set -e

echo "🚀 Starting System Setup..."

# 1. Update system and install prerequisites
echo "📦 Updating Ubuntu and installing base dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git build-essential software-properties-common

# Git and Github

sudo apt install git
echo "🔧 Configuring Git..."
git config --global user.name "ZenStudioHub"
git config --global user.email "canhtoannguyen60@gmail.com"
git config --global init.defaultBranch master

# 8. Generate SSH Key for this specific VM
echo "🔐 Setting up SSH Key for Git..."
SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

if [ ! -f "$SSH_KEY_PATH" ]; then
    # Generate a new modern ED25519 key with no passphrase
    ssh-keygen -t ed25519 -C "canhtoannguyen60@gmail.com" -f "$SSH_KEY_PATH" -N ""
    
    # Start the ssh-agent in the background and add the key
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_KEY_PATH"

    echo ""
    echo "===================================================================="
    echo "🚨 NEW SSH KEY GENERATED!"
    echo "Please copy the key below and add it to your GitHub/GitLab account:"
    echo "===================================================================="
    cat "${SSH_KEY_PATH}.pub"
    echo "===================================================================="
    echo ""
    
    # Pause the script so you can copy the key before the terminal clears
    read -p "Press [Enter] once you have copied the key above..."
else
    echo "✅ SSH key already exists at $SSH_KEY_PATH. Skipping generation."
fi

echo "🎉 Setup Complete! Your sandbox is fully armed and operational."
echo "⚠️ IMPORTANT: Please restart your terminal (or run 'source ~/.bashrc') to apply all path changes."


# 2. Install NVM (Node Version Manager)
echo "🟢 Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into the current script session so we can use it immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# 3. Install Node.js
echo "🟩 Installing latest Node.js LTS..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# Verify Node installation
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# yarn
npm install -g yarn

# 4. Install Google Chrome
echo "🌐 Installing Google Chrome..."
wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y /tmp/chrome.deb
rm /tmp/chrome.deb

# 5. Install Gemini CLI
echo "✨ Installing Gemini CLI..."
# Assuming standard NPM global installation
npm install -g @google/gemini-cli

# 6. Install Google Antigravity
echo "🛸 Installing Google Antigravity IDE..."
# NOTE: Since Antigravity is a specialized/internal tool, you will need to uncomment 
# and adjust one of the lines below depending on how you usually receive the package.

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
  sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
    sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

sudo apt update

sudo apt install antigravity

echo "✅ Setup Complete! All packages installed successfully."
echo "⚠️  IMPORTANT: Please close this terminal and open a new one to apply all path changes."
