#!/bin/bash

# Navigate to the Laravel root directory (adjust the path as needed)
cd /var/www

# Composer commands
composer install

# Run Laravel Artisan commands
php artisan key:generate
php artisan migrate

# Continue with the main process (e.g., starting Apache or PHP-FPM)
exec "$@"
