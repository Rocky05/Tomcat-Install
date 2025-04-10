#!/bin/bash

# Enter Tomcat Version to be Installed
TOMCAT_VERSION="10.1.39"

# Install Java
sudo yum install java -y > /dev/null 2>&1

# Download Tomcat 10 (or your desired version)
TOMCAT_URL="https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"
TOMCAT_ARCHIVE="apache-tomcat-${TOMCAT_VERSION}.tar.gz"

wget "$TOMCAT_URL"

# Extract Tomcat
sudo tar -xzf "$TOMCAT_ARCHIVE" -C /opt/

# Changing File permissions recursively
sudo chown -R jenkins:jenkins /opt/apache-tomcat-${TOMCAT_VERSION}

# Create symbolic link for easy access
sudo ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Clean up the downloaded archive
rm "$TOMCAT_ARCHIVE"

# Start Tomcat
sudo sh /opt/tomcat/bin/startup.sh

# Change Tomcat port to 8090
sudo sed -i "s/Connector port=\"8080\"/Connector port=\"8090\"/" /opt/tomcat/conf/server.xml

#Restart Tomcat to apply port change.
sudo sh /opt/tomcat/bin/shutdown.sh
sudo sh /opt/tomcat/bin/startup.sh

# Final Message
echo "Tomcat installation completed."
