#!/bin/bash

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s $1

echo "source $HOME/.rvm/scripts/rvm" >> /home/vagrant/.bash_profile
