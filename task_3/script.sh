#!/bin/bash
sudo apt update
sudo apt install -y apache2
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I)
echo "<html>" > /var/www/html/index.html
echo "<body>" >> /var/www/html/index.html
echo "<p><h1>Hostname: $HOSTNAME</h1></p>" >> /var/www/html/index.html
echo "<p><h1>IP Address: $IP_ADDRESS</h1></p>" >> /var/www/html/index.html
echo "</body>" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html