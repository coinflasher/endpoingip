#!/bin/bash

wget https://raw.githubusercontent.com/coinflasher/endpoingip/master/rhe7.sh
wget https://raw.githubusercontent.com/coinflasher/endpoingip/master/endpoint.service

chmod +x endpoint.service rhel7.sh

if [ ! -d /usr/local/sbin ]
then
  mkdir -p /usr/local/sbin
  mv rhe7.sh /usr/local/sbin
fi
mv endpoint.service /etc/systemd/system/
systemctl enable --now endpoint.service
