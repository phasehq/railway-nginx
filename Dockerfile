FROM nginx:stable-alpine3.20

# Remove default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx configuration template
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Create the script that will generate the final config and start nginx
RUN echo '#!/bin/sh\n\
envsubst \
    "\${FRONTEND_HOST} \${BACKEND_HOST} \${ALLOWED_HOSTS}" \
    < /etc/nginx/templates/default.conf.template \
    > /etc/nginx/conf.d/default.conf\n\
\n\
# Verify the configuration\n\
nginx -t\n\
\n\
# Start nginx\n\
nginx -g "daemon off;"' > /docker-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /docker-entrypoint.sh

# Expose HTTP port
EXPOSE 80

# Use the script as entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]