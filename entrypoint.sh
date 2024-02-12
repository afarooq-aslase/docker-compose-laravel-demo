#!/bin/bash
# Create the storage and bootstrap/cache directories if they don't exist
mkdir -p /var/www/storage /var/www/bootstrap/cache

# Set the correct permissions
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Navigate to the Laravel root directory
cd /var/www

# ensure env is loaded (should be set in volume before deployment)
stat .env

# clear cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear
php artisan route:clear


# Run Laravel Artisan commands
php artisan migrate --force
php artisan key:generate

# Continue with the main process (e.g., starting Apache or PHP-FPM)
exec "$@"
