#!/bin/sh
USERNAME=faatsan
IMAGE=php-apache

version=$(cat VERSION)
echo "version: $version"

CHECKIMAGE=$(sudo docker images | grep php-apache)

if [ -z $CHECKIMAGE ]; then

        sudo docker build -t beckblurry/php-apache:$version -f web/Dockerfile .
        sudo docker tag $USERNAME/$IMAGE:$version $USERNAME/$IMAGE:latest
        sudo docker push $USERNAME/$IMAGE:$version
        sudo docker push $USERNAME/$IMAGE:latest

        sudo docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=tiger -e MYSQL_DATABASE=png -e MYSQL_USER=png -e MYSQL_PASSWORD=png -d mysql:5.7
        sudo docker run --name php-apache -p 80:80 --link mysql:mysql --link redis:redis -d beckblurry/php-apache
        sudo docker run --name phpmyadmin -p 8280:80 --link mysql:mysql -e PMA_HOST=mysql -e PMA_PORT=3306 -d phpmyadmin/phpmyadmin
	sudo docker run --name redis -p 6379:6379 -d redis

else
        sudo docker build -t beckblurry/php-apache:$version -f web/Dockerfile .
        sudo docker tag $USERNAME/$IMAGE:$version $USERNAME/$IMAGE:latest
        sudo docker push $USERNAME/$IMAGE:$version
        sudo docker push $USERNAME/$IMAGE:latest

        sudo docker rm -f $(sudo docker ps -a | grep $IMAGE | awk '{print $1}'); sudo docker run --name $IMAGE -p 80:80 --link mysql:mysql --link redis:redis -d $USERNAME/$IMAGE:latest
fi
