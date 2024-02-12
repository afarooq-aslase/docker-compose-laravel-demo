#!/bin/bash

# Create the storage and bootstrap/cache directories if they don't exist
mkdir -p /var/www/storage /var/www/bootstrap/cache

# Set the correct permissions
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Navigate to the Laravel root directory (adjust the path as needed)
cd /var/www

# Install composer deps
RUN composer install --optimize-autoloader --no-dev

# Run Laravel Artisan commands
# clear cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear
php artisan route:clear

php artisan migrate --force
php artisan key:generate

# Continue with the main process (e.g., starting Apache or PHP-FPM)
exec "$@"
