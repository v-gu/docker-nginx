#!/usr/bin/env bash
set -e

# environment variables substitution
envsubst '\
${NGINX_HOST} \
${NGINX_PORT} \
${NGINX_GZIP} \
${NGINX_GZIP_VARY} \
${NGINX_GZIP_TYPES} \
${NGINX_GZIP_MINLEN} \
${NGINX_GZIP_STATIC} \
${NGINX_ERRLOG_OUTPUT} \
${NGINX_ERRLOG_LEVEL} \
${NGINX_ACCLOG_OUTPUT} \
${NGINX_ACCLOG_LEVEL} \
' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

envsubst '
${NGINX_HOST} \
${NGINX_PORT} \
${NGINX_GZIP} \
${NGINX_GZIP_VARY} \
${NGINX_GZIP_TYPES} \
${NGINX_GZIP_MINLEN} \
${NGINX_GZIP_STATIC} \
${NGINX_ERRLOG_OUTPUT} \
${NGINX_ERRLOG_LEVEL} \
${NGINX_ACCLOG_OUTPUT} \
${NGINX_ACCLOG_LEVEL} \
' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

exec "$@"
