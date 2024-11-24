#!/bin/sh

# Replace environment variables in nginx config
envsubst '${FRONTEND_HOST} ${BACKEND_HOST} ${ALLOWED_HOSTS}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Start nginx
exec "$@"
