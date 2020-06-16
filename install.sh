#!/bin/bash

# Clean existing files

if [ -s "rhel7.sh" ]
then
  rm -f rhel7.sh
fi
if [ -s "endpoint.service" ]
  rm -f endpoint.service
fi

# Download latest files 
wget https://raw.githubusercontent.com/coinflasher/endpoingip/master/rhel7.sh
wget https://raw.githubusercontent.com/coinflasher/endpoingip/master/endpoint.service

# Move files into place
if ! [ -s rhel7.sh ] && [ endpoint.service]
then
  echo "ERROR: Failed to downloaded needed files!"
  exit 1
fi

chmod +x endpoint.service rhel7.sh

if [ ! -d /usr/local/sbin ]
then
  mkdir -p /usr/local/sbin
  mv rhel7.sh /usr/local/sbin
fi
mv endpoint.service /etc/systemd/system/

# Start endpoint service
systemctl enable --now endpoint.service
