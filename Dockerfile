FROM nimmis/alpine-apache

MAINTAINER nimmis <kjell.havneskold@gmail.com>
# disable interactive functions

RUN apk update && apk upgrade && \
    apk add curl openssl && \
    apk add php7@testing php7-apache2@testing php7-openssl@testing php7-mbstring@testing && \
    apk add php7-apcu@testing php7-intl@testing php7-mcrypt@testing php7-json@testing php7-gd@testing php7-curl@testing && \
    apk add php7-fpm@testing php7-mysqlnd@testing php7-pgsql@testing php7-sqlite3@testing php7-phar@testing && \
    # waiting for module to be release on alpine
    # apk add php7-imagick@testing
    ln -s /usr/bin/php7 /usr/bin/php && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*


