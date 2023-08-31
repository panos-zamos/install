#!/bin/bash

# Define the username
USERNAME="panos"

# Check if the user is in the sudo group
if groups $USERNAME | grep &>/dev/null '\bsudo\b'; then
    echo "$USERNAME is a sudoer"
else
    echo "$USERNAME is not a sudoer, adding to the sudo group"
    usermod -aG sudo $USERNAME
fi

# Update the system
echo "Updating the system"
apt-get update -y

# Install curl if it's not already installed
echo "Installing curl"
apt-get install curl -y

# Install git if it's not already installed
echo "Installing git"
apt-get install git -y

# Install Docker if it's not already installed
echo "Installing Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Add user to docker group so it can execute docker commands
echo "Adding user to docker group"
usermod -aG docker $USERNAME

# Install other packages
echo "Installing other packages"
apt-get install -y htop btop mc bat clipit cloc glow google-chrome-stable keepassx multitail sloccount terminator vlc

# Done
echo "Done"
