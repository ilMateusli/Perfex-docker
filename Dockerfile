# Use uma imagem base do PHP com Apache
FROM php:8.1-apache-buster

# Instale as extensões do PHP necessárias para o Perfex CRM
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Adiciona as extensões PHP IMAP, GD e Zip
RUN apt-get update && \
    apt-get install -y libpng-dev libzip-dev libc-client-dev libkrb5-dev && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install gd zip imap

# Habilita o mod_rewrite do Apache para o Perfex CRM
RUN a2enmod rewrite

# Copia o código do Perfex CRM para o container
COPY . /var/www/html/

# Dá permissões para o Apache ser capaz de escrever em todos os arquivos e diretórios
RUN chown -R www-data:www-data /var/www && \
    chmod -R 777 /var/www/html/uploads && \
    chmod 777 /var/www/html/application/config && \
    chmod 777 /var/www/html/application/config/config.php && \
    chmod 777 /var/www/html/application/config/app-config-sample.php && \
    chmod 777 /var/www/html/temp
