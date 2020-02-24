FROM php:7.1.20-apache
RUN docker-php-ext-install pdo_mysql mysqli 
RUN a2enmod rewrite headers

COPY --chown=www-data:www-data web/data-web/ /var/www/html/
COPY web/php-extensions/php.ini /usr/local/etc/php/php.ini
COPY web/apache/default.conf /etc/apache2/sites-enabled/default.conf
COPY web/php-extensions/ioncube_loader_lin_7.1.so /usr/local/lib/php/extensions/no-debug-non-zts-20160303/
