FROM php:7.4-fpm

RUN apt update 2>/dev/null \
    && apt install -y nginx 2>/dev/null \
    && apt clean 2>/dev/null \
    && rm -rf /var/lib/apt/lists/* \
              /var/tmp/*

COPY resources/entrypoint.sh /entrypoint.sh
COPY files/ /var/www
WORKDIR /var/www

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
