#!/bin/bash
set -e

echo "🔄 Updating system..."
sudo apt update -y
sudo apt upgrade -y

echo "📦 Installing prerequisites for NVM and MongoDB..."
sudo apt install -y curl build-essential libssl-dev gnupg

echo "⬇️ Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "⬇️ Installing Node.js LTS using NVM..."
nvm install --lts
nvm use --lts

echo "🔐 Adding MongoDB GPG key..."
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
  sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

echo "📝 Adding MongoDB APT repository (using jammy instead of noble)..."
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

echo "🔄 Updating package list again..."
sudo apt update -y

echo "📦 Installing MongoDB..."
sudo apt install -y mongodb-org

echo "🚀 Starting and enabling MongoDB..."
sudo systemctl start mongod
sudo systemctl enable mongod

echo "✅ Setup complete!"

