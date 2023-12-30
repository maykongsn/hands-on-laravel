FROM php:8.1-fpm

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    apt-utils

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip \
    libpng-dev \
    libpq-dev \
    libxml2-dev

RUN docker-php-ext-install pdo pdo_pgsql pgsql session xml

WORKDIR /var/www

COPY . .

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

CMD php artisan serve --host=0.0.0.0 --port=8000
