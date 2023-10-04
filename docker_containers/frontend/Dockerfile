FROM nginx:1.23-alpine-slim

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY ./certbot/www/ /var/www/certbot

COPY ./dist /usr/share/nginx/public