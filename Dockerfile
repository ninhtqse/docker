FROM wyveo/nginx-php-fpm:php81

WORKDIR /var/www/html

ADD ./code/html /var/www/html