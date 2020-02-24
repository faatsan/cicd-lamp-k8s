#!/bin/sh
USERNAME=beckblurry
IMAGE=php-apache

version=`cat VERSION`
echo "version: $version"

sudo docker build -t beckblurry/php-apache:latest -f web/Dockerfile .

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version