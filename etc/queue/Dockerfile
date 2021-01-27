FROM php:7.2-cli

ADD php.ini "$PHP_INI_DIR/php.ini"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libxpm-dev \
    libvpx-dev \
    libpng-dev \
    libpq-dev \
    libgmp-dev \
    libldap2-dev \
    g++ \
    libicu-dev \
    libxml2-dev \
    vim \
    libmcrypt-dev \
    zlib1g-dev \
    libmagickwand-dev --no-install-recommends \
    libzip-dev \
    procps \
    librabbitmq-dev \
    libssh-dev \
    libxrender1 \
    libfontconfig1 \
    libpcre3-dev \
    libbz2-dev \
    libonig-dev \
    zip \
    unzip \
    libxslt-dev \
    supervisor

RUN pecl install mcrypt

RUN docker-php-ext-install intl \
    && docker-php-ext-configure intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install sockets \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && pecl install apcu \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install exif

RUN docker-php-source extract && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    docker-php-source delete

ADD default-job-worker.conf /etc/supervisor/conf.d/default-job-worker.conf
ADD emails-job-worker.conf /etc/supervisor/conf.d/emails-job-worker.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
