#!/bin/bash

# Update and install Docker
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
newgrp docker

# Create project directory
mkdir -p ~/lxqt-vnc-setup/docker
cd ~/lxqt-vnc-setup/docker

# Build Docker image
docker build -t lxqt-vnc .

# Run Docker container
docker run -d --restart unless-stopped --name lxqt-vnc -p 6080:6080 lxqt-vnc

# Configure auto-start
echo 'if ! docker ps | grep -q lxqt-vnc; then docker start lxqt-vnc; fi' >> ~/.bashrc
