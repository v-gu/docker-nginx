#!/usr/bin/env bash
set -e

# environment variables substitution
envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

exec "$@"
