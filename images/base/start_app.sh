#!/bin/bash
#
#  This script should be used for generating .env file for Laravel
#
# echo "Install dependencies"
# composer install

if [ "${APP_DB}" = true ]
then
echo "Create database if exist"
php bin/console doctrine:database:create --if-not-exists

echo "Migrate database"
php bin/console doctrine:migrations:migrate --no-interaction
fi

# run container
symfony server:stop && symfony server:start --port="${ENV_APP_PORT}"

