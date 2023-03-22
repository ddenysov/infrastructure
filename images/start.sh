#!/bin/bash
#
#  This script should be used for generating .env file for Laravel
#
echo "Install dapandencies"
composer install

echo "Create database if exist"
php bin/console doctrine:database:create --if-not-exists

echo "Migrate database"
php bin/console doctrine:migrations:migrate --no-interaction

