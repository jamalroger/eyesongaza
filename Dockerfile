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
    xml \
	opcache

COPY . /app

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --prefer-dist --no-dev

EXPOSE 8000



ENTRYPOINT ["php", "artisan", "octane:frankenphp"]



