#!/bin/bash

apt-get update -y && apt-get upgrade -y
apt-get install sudo vim ssh openssh-client openssh-server nmap ufw iptables-persistent fail2ban apache2 portsentry sendmail sendmail-cf sendmail-bin
mv sudoers /etc/
adduser anjada sudo
sudo mv interfaces /etc/network/
sudo service networking restart
sudo mv sshd_config /etc/ssh/
sudo mv ssh_config /etc/ssh/
sudo service sshd restart
sudo ufw allow http
sudo ufw allow https
sudo mv jail.conf /etc/fail2ban
sudo ufw reload
sudo service fail2ban restart
sudo mv portsentry /etc/default/
sudo mv portsentry.conf /etc/portsentry/
sudo mv portsentry.ignore.static /etc/portsentry/
sudo service portsentry restart
sudo crontab -e
sudo mv crontab /etc/
sudo mv ssl-params.conf /etc/apache2/conf-available/
sudo mv default-ssl.conf /etc/apache2/sites-available/
sudo mv 000-default.conf /etc/apache2/sites-available/
sudo a2enmod ssl
sudo a2enmod headers
sudo a2ensite default-ssl
sudo a2enconf ssl-params
systemcrl restart apache2
echo  "Nastroya zavershina"
