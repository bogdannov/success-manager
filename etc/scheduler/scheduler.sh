#!/usr/bin/env bash

while [[ true ]]
    do
      php /var/www/site/artisan schedule:run --no-interaction &
      sleep 60
    done
