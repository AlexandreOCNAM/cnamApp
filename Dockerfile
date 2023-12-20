FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    unzip \
    zip \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod proxy \
 && a2enmod proxy_http \
 && wget -qO- https://get.pnpm.io/install.sh | sh -
COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

COPY ./deploy/ /var/www/html

WORKDIR /var/www/html/api

RUN pnpm install \
 && pnpm install pm2 -g \
 && env PATH=$PATH:/usr/local/lib/node_modules/pm2/bin/pm2


# Exposer le port 80 pour permettre les connexions entrantes
EXPOSE 80

# Définir l'entrée de l'application
CMD pm2 start ./index.js && apache2-foreground
