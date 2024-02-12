#!/bin/bash
# Create the storage and bootstrap/cache directories if they don't exist
mkdir -p /var/www/storage /var/www/bootstrap/cache

# Set the correct permissions
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Navigate to the Laravel root directory (adjust the path as needed)
cd /var/www

# Composer commands
composer install

# Run Laravel Artisan commands
php artisan key:generate
php artisan migrate

# Continue with the main process (e.g., starting Apache or PHP-FPM)
exec "$@"
