FROM php:7.4-fpm

LABEL maintainer="ninhtqse <ninhtqse@gmail.com>"

# Arguments defined in docker-compose.yml
ARG user

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip

# Install ZIP
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions zip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Heathcheck
COPY docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

# Set working directory
WORKDIR /var/www/html

USER $user

# Grant permission to file & folder
RUN find . -type d -exec chmod 775 {} \;
RUN find . -type f -exec chmod 644 {} \;

CMD ["php-fpm"]