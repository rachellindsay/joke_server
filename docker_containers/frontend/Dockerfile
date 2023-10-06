FROM nginx:1.23-alpine-slim

# looking for /etc/nginx/conf.d/default.conf, i cant' find it. I think it's being saved at etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

COPY ./dist /usr/share/nginx/public