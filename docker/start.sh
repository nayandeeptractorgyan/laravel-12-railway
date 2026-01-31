#!/bin/sh

# Simple wait for MySQL
echo "Waiting for MySQL to be ready..."
sleep 5

# Run migrations
php artisan migrate --force || echo "Migrations skipped"

# Cache configuration for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Start supervisor
exec /usr/bin/supervisord -c /etc/supervisord.conf