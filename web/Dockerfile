FROM php:7.1.20-apache
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y
RUN apt-get -y install apt-utils nano wget dialog
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip 
RUN pecl install redis && docker-php-ext-enable redis
RUN docker-php-ext-install pdo_mysql mysqli 
RUN a2enmod rewrite headers

COPY --chown=www-data:www-data web/data-web/ /var/www/html/
COPY web/php-extensions/php.ini /usr/local/etc/php/php.ini
COPY web/apache/default.conf /etc/apache2/sites-enabled/default.conf
COPY web/php-extensions/ioncube_loader_lin_7.1.so /usr/local/lib/php/extensions/no-debug-non-zts-20160303/
