#!/bin/sh
USERNAME=faatsan
IMAGE=php-apache

version=`cat VERSION`
echo "version: $version"

sudo git pull 

# tag it
sudo git add -A
sudo git commit -m "version $version"
sudo git tag -a "$version" -m "version $version"
sudo git push
sudo git push --tags
