FROM composer:2

SHELL ["/bin/bash", "-c"]

RUN apk add --no-cache bash shadow

WORKDIR /app

RUN usermod -u 1000 www-data && \
    usermod -u 1000 -g www-data www-data && \
    rm -rf /var/www/* && \
    chown www-data:www-data /var/www -R
        
USER www-data

CMD composer require ictools/env-generator; php vendor/ictools/env-generator/src/generate.php;
