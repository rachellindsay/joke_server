# This will be the Dockerfile for the web server (based on nginx, probably nginx:1.23-alpine)
FROM nginx:1.23-alpine


# nginx has /etc/nginx/nginx.conf, which includes
# include /etc/nginx/conf.d/*.conf;
# /etc/nginx/conf.d has a default.conf, and one per site.
# we have just the one site, so are overriding the provided default.conf, which
# doesn't do quite what we want anyway
COPY ./default.conf /etc/nginx/conf.d/default.conf


# stuff in ./htmlEtc (relative to where this file lives) shows up in the nginx container at /usr/share/nginx/html
# the nginx config defines this as where it looks for html
COPY ./htmlEtc /usr/share/nginx/html
