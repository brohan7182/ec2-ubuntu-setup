# 🚀 EC2 Ubuntu Setup Script

This repository contains a shell script to **automate the setup** of a fresh **Ubuntu 24.04 EC2 instance** with the following:

- ✅ System update & upgrade
- ✅ Node.js installation via NVM (Node Version Manager)
- ✅ MongoDB 7.0 setup using Ubuntu 22.04 (jammy) repo (since MongoDB doesn't yet support 24.04 officially)

---

## 📦 What It Installs

- `curl`, `build-essential`, `libssl-dev`, `gnupg`
- NVM (Node Version Manager)
- Node.js (latest LTS version)
- MongoDB 7.0
- Enables and starts MongoDB as a service

---

## 📁 Files

- `setup.sh`: Main automation script for setting up everything

---

## ⚙️ How to Use

### Step 1: Clone this repository

```bash
git clone https://github.com/brohan7182/ec2-ubuntu-setup.git
cd ec2-ubuntu-setup

**Step 2: Make the script executable**
bash
Copy code
chmod +x setup.sh

**Step 3: Run the script**
bash
Copy code
./setup.sh

**Verifying Installation**
After the script finishes, verify everything:

bash
Copy code
# Node.js
node -v
npm -v
nvm --version

# MongoDB
mongod --version
sudo systemctl status mongod
mongosh
