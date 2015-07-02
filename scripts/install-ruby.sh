#!/bin/bash

source /usr/local/rvm/scripts/rvm

# Prepare to compile ruby
rvm requirements

# Install specify ruby version
rvm use --install $1

shift

# Install necessary gems
if (( $# ))
then gem install $@
fi
