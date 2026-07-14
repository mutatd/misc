#!/data/data/com.termux/files/usr/bin/bash

set -e 

pkg update -y && yes '' | pkg upgrade -y

pkg install -y \
    build-essential \
    git \
    curl \
    wget \
    openssh \
    python \
    nmap \
    tor \

cd

mkdir ~/.software
    wget https://github.com/ffuf/ffuf/releases/download/v2.2.1/ffuf_2.2.1_linux_arm64.tar.gz
    tar -xvf ffuf_2.2.1_linux_arm64.tar.gz -C ~/.software/ ffuf && rm ffuf_2.2.1_linux_arm64.tar.gz

mkdir -p ~/.termux
cat > ~/.termux/termux.properties << 'EOF'
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
use-black-ui = true
bell-character = ignore
EOF
termux-reload-settings

cat >> ~/.bashrc << 'EOF'

# General
alias ll='ls -l'
alias la='ls -a'
alias e='exit'
alias c='clear'
alias update='pkg update -y && pkg upgrade -y'

# Software
alias ffuf='/data/data/com.termux/files/home/.software/ffuf'
EOF

echo "Termux setup complete!"
