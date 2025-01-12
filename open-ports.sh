#!/usr/bin/env bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Ensure the script is run as root
[[ $EUID -ne 0 ]] && echo -e "[Error] This script must be run as root!" && exit 1

# Prompt the user for the port number
read -p "Enter the port number you want to open: " port

# Validate the port number
if [[ ! $port =~ ^[0-9]+$ ]] || [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
    echo -e "[Error] Invalid port number. Please enter a number between 1 and 65535."
    exit 1
fi

# Detect the OS and install firewalld if necessary
if [ -f /etc/redhat-release ]; then
    sudo yum install -y firewalld && sudo systemctl start firewalld && sudo systemctl enable firewalld
elif [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt install -y firewalld && sudo systemctl start firewalld && sudo systemctl enable firewalld
elif [ -f /etc/os-release ] && grep -q "Arch" /etc/os-release; then
    sudo pacman -Syu --noconfirm firewalld && sudo systemctl start firewalld && sudo systemctl enable firewalld
else
    echo -e "[Error] Unsupported OS. Please install firewalld manually."
    exit 1
fi

# Open the specified port for both TCP and UDP
sudo firewall-cmd --permanent --add-port=${port}/tcp
sudo firewall-cmd --permanent --add-port=${port}/udp

# Reload firewalld to apply changes
sudo firewall-cmd --reload

# List open ports to confirm
echo -e "[Info] The following ports are open:"
sudo firewall-cmd --list-ports
