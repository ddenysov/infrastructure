FROM php:8.2-alpine
ARG APP_REPO
ARG APP_MODE
ARG APP_PORT
ARG CACHE_DROP
WORKDIR /var/www
RUN rm -rf html
ENV ENV_APP_PORT=$APP_PORT

RUN apk update && apk --no-cache add bash git supervisor
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.3.1
RUN apk add libpq-dev && docker-php-ext-install pdo pdo_pgsql pgsql

RUN apk --update --no-cache add build-base \
        autoconf \
        rabbitmq-c-dev
RUN pecl install amqp
RUN docker-php-ext-enable amqp

RUN echo $CACHE_DROP && rm -rf * && git clone $APP_REPO . && composer install

COPY ./start_app.sh /
RUN chmod +x /start_app.sh

RUN touch /var/${APP_MODE}_FILE
RUN if [[ $APP_MODE = 'app' ]] ; then cp /start_app.sh /start.sh && chmod +x /start.sh ; fi
RUN if [[ $APP_MODE = 'supervisor' ]] ; then supervisord -c /etc/supervisor/conf/messenger-worker.conf ; fi

COPY ./conf/messenger-worker.conf /etc/supervisor/conf/

RUN touch /var/${RUNTIME}_FILEXYZ

ENTRYPOINT ["/start.sh"]