FROM canals/php:8.3
RUN rm /usr/local/etc/php/php.ini
COPY php.ini /usr/local/etc/php/php.ini
