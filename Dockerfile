FROM php:7.4-apache

<<<<<<< HEAD
ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./deploy/ /var/www/html

WORKDIR /var/www/html

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
&& curl -sSk https://getcomposer.org/installer | php -- --disable-tls \
&& mv composer.phar /usr/local/bin/composer \
&& apt-get update && apt-get install -y \
    curl \
    git \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libpng-dev \
    libreadline-dev \
    libzip-dev \
    libpq-dev \
    unzip \
    zip \
&& rm -rf /var/lib/apt/lists/* \
&& a2enmod rewrite headers \
&& composer install --prefer-dist \
&& composer dump-autoload --optimize \
&& composer update
=======
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy
RUN a2enmod proxy_http
COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

COPY ./deploy/ /var/www/html

WORKDIR /var/www/html/api

RUN npm install 

RUN npm install pm2 -g

RUN env PATH=$PATH:/usr/local/lib/node_modules/pm2/bin/pm2

>>>>>>> 3c5d2a479b272df56ce29fe22dc49940db4fef5f

# Exposer le port 80 pour permettre les connexions entrantes
EXPOSE 80

# Définir l'entrée de l'application
<<<<<<< HEAD
CMD ["apache2-foreground"]
=======
CMD pm2 start ./index.js && apache2-foreground
>>>>>>> 3c5d2a479b272df56ce29fe22dc49940db4fef5f
