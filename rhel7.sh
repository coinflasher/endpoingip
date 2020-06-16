#!/bin/bash

# Get current IP address of rhel7 endpoint
RHEL7IP=$(getent ahosts ec2-13-58-39-152.us-east-2.compute.amazonaws.com | head -1 | awk {'print $1'})

# Test for rhel7 hostname in /etc/hosts

if ! grep -q rhel7 /etc/hosts
then
# Add /etc/hosts entry for rhel7
  echo "${RHEL7IP} rhel7" >> /etc/hosts
else
# Find the line number of the existing rhel7 entry
  LINENUM=$(grep -n rhel7 /etc/hosts | cut -d : -f 1)
# Change existing entry to match current IP address
  sed -i "${LINENUM}s/^[0-9].*\s/${RHEL7IP} /" /etc/hosts
fi
