FROM php:8.1-fpm

WORKDIR /var/www

LABEL maintainer="ninhtqse <ninhtqse@gmail.com>"

# Install libs
RUN apt-get update && apt-get install -y \
  build-essential \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  locales \
  zip \
  jpegoptim optipng pngquant gifsicle \
  vim \
  unzip \
  git \
  curl \
  cron 

# Install PHP libraries
RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libicu-dev \
  libpng-dev

# Install lib mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN docker-php-ext-install pcntl

# Install package cake php
RUN docker-php-ext-install \
  intl

# Install ZIP
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions zip

# Install lib redis
RUN pecl install -o -f redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable redis

# Install lib image laravel
RUN apt-get install -y libpng-dev
RUN docker-php-ext-install gd

# Turn on xdebug
RUN yes | pecl install xdebug-3.1.0 \
  && docker-php-ext-enable xdebug \
  && echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.client_host = host.docker.internal"

# Install lib exif
RUN docker-php-ext-install exif

# Install lib socket
RUN docker-php-ext-install sockets

# For watermark is error do not read jpg file
RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd

# Config php.ini
COPY config/php.ini /usr/local/etc/php/

# Heathcheck
COPY docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown www-data:www-data /var
RUN usermod -u 1000 www-data

USER www-data

CMD ["php-fpm"]