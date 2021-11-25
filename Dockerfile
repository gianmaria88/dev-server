FROM brettt89/silverstripe-web:7.4-apache
ENV DOCUMENT_ROOT /var/www/html/public

COPY ./src $DOCUMENT_ROOT
WORKDIR $DOCUMENT_ROOT
RUN install-php-extensions xdebug
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install unzip zip git wget