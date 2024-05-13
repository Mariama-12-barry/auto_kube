FROM php:apache

RUN docker-php-ext-install mysqli

COPY . /var/www/html/

RUN chmod -R 755 /var/www/html/

RUN a2enmod rewrite


