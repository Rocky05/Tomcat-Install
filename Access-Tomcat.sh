# Create Tomcat Manager user
sudo sh -c "echo '<tomcat-users><user username=\"manager\" password=\"Mana@0321\" roles=\"manager-gui,manager-script\"/></tomcat-users>' >> /opt/tomcat/conf/tomcat-users.xml"

# Optional: Add user to existing file. Append instead of overwrite.
# sudo sh -c "echo '<user username=\"manager\" password=\"managerpassword\" roles=\"manager-gui,manager-script\"/>' >> /opt/tomcat/conf/tomcat-users.xml"

# Restart Tomcat to apply changes
sudo systemctl restart tomcat

# Check Tomcat service status
sudo systemctl status tomcat

# Open Tomcat Manager in your browser: http://<your_instance_public_ip>:8080/manager/html
echo "Tomcat installation complete. Open Tomcat Manager in your browser: http://<your_instance_public_ip>:8080/manager/html"
echo "Username: manager"
echo "Password: mana@0321"

echo '<Context><Valve className="org.apache.catalina.valves.RemoteAddrValve" allow=".*"/></Context>' | sudo tee -a /opt/tomcat/webapps/manager/META-INF/context.xml
