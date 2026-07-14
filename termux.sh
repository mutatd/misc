#!/data/data/com.termux/files/usr/bin/bash

set -e 

pkg update -y

pkg upgrade -y

pkg install -y \
    build-essential \
    git \
    curl \
    wget \
    openssh \
    python \
    nmap \
    tor \

mkdir ~/.software


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

EOF

echo "Termux setup complete!"
