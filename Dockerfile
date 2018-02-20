FROM nginx:1.13.8-alpine-perl
MAINTAINER Vincent Gu <v@bitmart.com>

ENV NGINX_HOST                  localhost.localdomain
ENV NGINX_REDIRECT_FROM_HOST    ""
ENV NGINX_PORT                  80
ENV NGINX_ERRLOG_OUTPUT         /dev/stderr
ENV NGINX_ERRLOG_LEVEL          warn
ENV NGINX_ACCLOG_OUTPUT         /dev/stderr
ENV NGINX_ACCLOG_LEVEL          main

ENV NGINX_GZIP                  on
ENV NGINX_GZIP_VARY             on
ENV NGINX_GZIP_TYPES            *
ENV NGINX_GZIP_MINLEN           1000
ENV NGINX_GZIP_STATIC           off

# install dependencies
ENV DEP bash
RUN set -ex \
    && apk add --update $DEP \
    && rm -rf /var/cache/apk/*

# define default directory
WORKDIR /usr/share/nginx

# copy over files
ADD entrypoint.sh /entrypoint.sh
ADD nginx.conf.template /etc/nginx/nginx.conf.template
ADD default.conf.template /etc/nginx/conf.d/default.template

ENTRYPOINT ["/entrypoint.sh", "nginx"]
CMD ["-g", "daemon off;"]
