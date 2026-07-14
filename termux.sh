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

# Termux specific paths
TERMUX_HOME="/data/data/com.termux/files/home"
TERMUX_ETC="/data/data/com.termux/files/usr/etc"
BASHRC_SYSTEM="$TERMUX_ETC/bash.bashrc"
PROFILE_SYSTEM="$TERMUX_ETC/profile"

# Create the etc directory if it doesn't exist
mkdir -p "$TERMUX_ETC"

# Create the system-wide bash.bashrc
cat > "$BASHRC_SYSTEM" << 'EOF'
# System-wide bash configuration for Termux

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history length
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command
shopt -s checkwinsize

# Enable color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -a'
alias e='exit'
alias c='clear'
alias update='pkg update -y && pkg upgrade -y'
alias ffuf='/data/data/com.termux/files/home/.software/ffuf'

# Create the system-wide profile (for login shells)
cat > "$PROFILE_SYSTEM" << 'EOF'
# System-wide profile for Termux

# Source bash.bashrc for interactive login shells
if [ -n "$BASH_VERSION" ]; then
    if [ -f /data/data/com.termux/files/usr/etc/bash.bashrc ]; then
        . /data/data/com.termux/files/usr/etc/bash.bashrc
    fi
fi
EOF

# Make files readable
chmod 644 "$BASHRC_SYSTEM"
chmod 644 "$PROFILE_SYSTEM"

# Clean up home directory - remove ALL shell config and hidden files
echo "Cleaning up home directory..."
rm -rf * .*

mkdir ~/.software
    wget https://github.com/ffuf/ffuf/releases/download/v2.2.1/ffuf_2.2.1_linux_arm64.tar.gz
    tar -xvf ffuf_2.2.1_linux_arm64.tar.gz -C ~/.software/ ffuf && rm ffuf_2.2.1_linux_arm64.tar.gz

clear

echo "Termux configured."
