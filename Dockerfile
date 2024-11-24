FROM nginx:stable-alpine3.20

# Remove default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx configuration template and entrypoint script
COPY nginx.conf /etc/nginx/templates/default.conf.template
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /docker-entrypoint.sh

# Expose HTTP port
EXPOSE 80

# Use the script as entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]