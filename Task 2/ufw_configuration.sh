#!/bin/bash

# Install UFW
sudo apt update
sudo apt install -y ufw

# Reset UFW to default
sudo ufw reset

# Set default rules
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Deny HTTP
sudo ufw deny http

# Enable UFW
sudo ufw enable

# Display UFW status
sudo ufw status verbose
