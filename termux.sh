#!/data/data/com.termux/files/usr/bin/bash

clear

set -e

pkg update -y && pkg upgrade -y

pkg install -y \
    build-essential \
    git \
    curl \
    wget \
    openssh \
    python \
    nmap \
    tor

cd ~

mkdir -p ~/.software
cd ~/.software
wget https://github.com/ffuf/ffuf/releases/download/v2.2.1/ffuf_2.2.1_linux_arm64.tar.gz
tar -xvf ffuf_2.2.1_linux_arm64.tar.gz && rm ffuf_2.2.1_linux_arm64.tar.gz
cd ~

mkdir -p ~/.termux
cat > ~/.termux/termux.properties << 'EOF'
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
use-black-ui = true
bell-character = ignore
EOF
termux-reload-settings

cat >> ~/.bashrc << 'EOF'
alias ll='ls -l'
alias la='ls -a'
alias e='exit'
alias c='clear'
alias update='pkg update -y && pkg upgrade -y'
alias ffuf='/data/data/com.termux/files/home/.software/ffuf'
EOF

source ~/.bashrc

clear

echo "Termux setup complete!"
