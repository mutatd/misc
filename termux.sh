#!/data/data/com.termux/files/usr/bin/bash

clear

set -e 

pkg update -y && yes '' | pkg upgrade -y

# pkg install -y \
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

mv ~/.termux /data/data/com.termux/files/usr/etc/

cat >> /data/data/com.termux/files/usr/etc/.bashrc << 'EOF'
alias ll='ls -l'
alias la='ls -a'
alias e='exit'
alias c='clear'
alias update='pkg update -y && pkg upgrade -y'
alias ffuf='/data/data/com.termux/files/home/.software/ffuf'
EOF

source /data/data/com.termux/files/usr/etc/.bashrc

clear

echo "Termux setup complete!"
