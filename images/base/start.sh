#!/bin/bash
#
#  This script should be used for generating .env file for Laravel
#
git clone "${APP_REPO}" .

echo "Install dependencies"
composer install

if [ "${APP_DB}" = true ]
then
echo "Create database if exist"
php bin/console doctrine:database:create --if-not-exists

echo "Migrate database"
php bin/console doctrine:migrations:migrate --no-interaction
fi

if [ "${APP_MODE}" = app ]
then
symfony server:stop && symfony server:start --port="${APP_PORT}"
fi

if [ "${APP_MODE}" = supervisor ]
then
supervisord -c /etc/supervisor/conf/messenger-worker.conf
fi
