#!/bin/bash

# Log Box build time
date > /etc/vagrant_box_build_time

# Install Vagrant Keys
mkdir -pm 700 /home/rails/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/rails/.ssh/authorized_keys
chmod 0600 /home/rails/.ssh/authorized_keys
chown -R rails /home/rails/.ssh

# Customize message of the day
echo 'Rails Development Box' > /etc/motd
