FROM php:8.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    libbz2-dev \
    libicu-dev \
    libzip-dev

RUN docker-php-ext-install \
  bcmath exif \
  && docker-php-ext-configure zip \
  && docker-php-ext-install -j$(nproc) bz2 \
  && docker-php-ext-configure zip \
  && docker-php-ext-install zip \
  && docker-php-ext-install intl

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# user init
RUN useradd -ms /bin/bash composer_docker
USER composer_docker
WORKDIR /home/composer_docker
