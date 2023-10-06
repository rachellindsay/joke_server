FROM nginx:1.23-alpine-slim

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

COPY ./dist /usr/share/nginx/public