#!/bin/bash

if [ -z "$1" ]; then
    echo "No IP specified" 1>&2
    exit 1
else
    echo "IP: $1"
fi

git clone https://github.com/SUSE/Portus.git portus
cd portus
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
./compose-setup.sh -e $1
rm -f docker/environment
rm -f docker/registry/config.yml
