#!/bin/bash

# Removing existing context.xml file
rm -rf /opt/tomcat/webapps/manager/META-INF/context.xml

# Removing existing tomcat-users.xml file
rm -rf /opt/tomcat/conf/tomcat-users.xml

# Deploying newly updated context.xml in manager directory
mv $WORKSPACE/context.xml /opt/tomcat/webapps/manager/META-INF/

# Deploying newly updated tomcat-users.xml in manager directory
mv $WORKSPACE/tomcat-users.xml /opt/tomcat/conf/
