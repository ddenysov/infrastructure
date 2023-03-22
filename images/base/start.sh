#!/bin/bash
#
#  This script should be used for generating .env file for Laravel
#
git clone "${APP_REPO}" .

echo "Install dependencies"
composer install

echo "Create database if exist"
php bin/console doctrine:database:create --if-not-exists

echo "Migrate database"
php bin/console doctrine:migrations:migrate --no-interaction

if [ "${APP_MODE}" = app ]
then
echo "symfony server:stop && symfony server:start --port=${APP_PORT}"
fi

if [ "${APP_MODE}" = supervisor ]
then
echo "supervisord -c /var/www/etc/supervisor/conf/messenger-worker.conf"
fi
