#!/bin/bash

# Download and extract the file
wget https://cdn.app.multiple.cc/client/linux/x64/multipleforlinux.tar
tar -xvf multipleforlinux.tar

# Change to the extracted directory
cd multipleforlinux

# Grant execute permissions
chmod +x ./multiple-cli
chmod +x ./multiple-node

# Add the path to /etc/profile
echo "PATH=\$PATH:/root/multipleforlinux" >> /etc/profile

# Source the updated profile
source /etc/profile

# Change directory and adjust permissions
cd ..
chmod -R 777 multipleforlinux

# Return to the multipleforlinux directory
cd multipleforlinux

# Run multiple-node in the background
nohup ./multiple-node > output.log 2>&1 &

# Run multiple-cli with desired settings
multiple-cli bind --bandwidth-download 100000 --identifier H74YUQ9H --pin 081296 --storage 20000000 --bandwidth-upload 100000

# Start multiple-cli
multiple-cli start

