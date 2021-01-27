# Installation

```
cp docker-compose.yml.dist docker-compose.yml
cp env.dist env

docker-compose build
docker-compose up -d

docker-compose exec app bash

composer install
php artisan key:generate


```

If you would have some problems with mysql, please contact me

