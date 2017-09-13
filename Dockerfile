FROM adminer:4.3.1

USER root

RUN set -x \
&&	apk add --no-cache --virtual .build-deps autoconf openssl-dev pcre-dev g++ make \
&&  pecl install mongodb \
&&  echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini \
&&	apk del .build-deps autoconf openssl-dev pcre-dev g++ make

USER adminer

ADD adminer.php .
ADD adminer.css .

EXPOSE 8080

