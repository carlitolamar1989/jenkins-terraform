#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install Java 17 — Jenkins requires Java to run
sudo apt-get install -y fontconfig openjdk-17-jre

# Import the Jenkins GPG signing key from Ubuntu keyserver
sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 7198F4B714ABFC68
sudo gpg --export 7198F4B714ABFC68 | sudo tee /usr/share/keyrings/jenkins-keyring.gpg > /dev/null

# Add the Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update again and install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
