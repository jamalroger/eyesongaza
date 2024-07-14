FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    gd \
	intl \
	zip \
    bcmath \
    mbstring \
    tokenizer \
    xml \
	opcache 
    

COPY . /app

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --prefer-dist --no-dev

RUN mv .envprod .env

RUN php artisan optimize 

# RUN php artisan migrate 

ENTRYPOINT ["php", "artisan", "octane:frankenphp"]



