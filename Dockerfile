FROM nimmis/alpine-apache

LABEL maintainer="nimmis <kjell.havneskold@gmail.com>" \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.name="Apache2/php7 on Alpine OS" \
      org.label-schema.url="https://www.nimmis.nu" \
      org.label-schema.vcs-url="https://github.com/nimmis/docker-alpine-apache-php7.git"

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@edge https://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && apk upgrade && \

    # Make info file about this build
    printf "Build of nimmis/alpine-apache-php7, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/alpine-apache-php7 && \
    apk add libressl@edge && \
    apk add curl openssl && \
    apk add php7@community php7-apache2@community php7-openssl@community php7-mbstring@community && \
    apk add php7-apcu@testing php7-intl@community php7-mcrypt@community php7-json@community php7-gd@community php7-curl@community && \
    apk add php7-fpm@community php7-mysqlnd@community php7-pgsql@community php7-sqlite3@community php7-phar@community && \
    # waiting for module to be release on alpine
    # apk add php7-imagick@testing

    # fix compatible with old scripts
    ln -s /usr/bin/php7 /usr/bin/php && \

    # install composer
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \

    #clear cache
    rm -rf /var/cache/apk/*


