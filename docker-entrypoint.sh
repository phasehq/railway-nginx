#!/bin/sh

# Substitute environment variables in the nginx configuration template
envsubst \
    "\${FRONTEND_HOST} \${BACKEND_HOST} \${ALLOWED_HOSTS}" \
    < /etc/nginx/templates/default.conf.template \
    > /etc/nginx/conf.d/default.conf

# Verify the configuration
nginx -t

# Start nginx
nginx -g "daemon off;"