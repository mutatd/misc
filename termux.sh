#!/data/data/com.termux/files/usr/bin/bash

# Termux Setup Script
# Designed to be executed via: curl -sL <url> | bash

set -e  # Exit on error

# Update package lists
pkg update -y

# Upgrade existing packages
pkg upgrade -y

# Install essential packages
pkg install -y \
    build-essential \
    git \
    curl \
    wget \
    openssh \
    python \
    nmap \
    tor \

# Termux styling
mkdir -p ~/.termux
cat > ~/.termux/termux.properties << 'EOF'
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
use-black-ui = true
bell-character = ignore
EOF
termux-reload-settings

echo "Termux setup complete!"
