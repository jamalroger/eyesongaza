FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl \
    pdo_mysql \
    gd \
	intl \
	zip \
    bcmath \
    mbstring \
    tokenizer \
    sockets \
    xml \
	opcache \
    mongodb-stable

COPY . /app

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --prefer-dist --no-dev

RUN mv .envprod .env

EXPOSE 8080 

CMD ["php", "artisan", "octane:start", "--server=frankenphp", "--host=0.0.0.0", "--port=8080", "-d"]



