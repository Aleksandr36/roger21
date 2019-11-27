#!bin/bash

sudo apt-get update -y | sudo tee -a /var/log/update_script.log
sudo apt-get upgrade -y | sudo tee -a /var/log/update_script.log

exit 0
