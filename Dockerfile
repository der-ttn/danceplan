FROM nginx:alpine

# Labels für bessere Metadata
LABEL org.opencontainers.image.title="TTN Festival Tanzplan Generator"
LABEL org.opencontainers.image.description="Festival Tanzplan Generator für Techno Tanz Überprüfungsverein Nord e.V."
LABEL org.opencontainers.image.vendor="Techno Tanz Überprüfungsverein Nord e.V."
LABEL org.opencontainers.image.licenses="MIT"

# Security: Erstelle non-root user
RUN addgroup -g 1001 -S nginx-app && \
    adduser -S -D -H -u 1001 -h /var/cache/nginx -s /sbin/nologin -G nginx-app -g nginx-app nginx-app

# Kopiere die HTML-Datei
COPY src/index.html /usr/share/nginx/html/

# Kopiere Custom nginx.conf für bessere Performance
COPY nginx.conf /etc/nginx/nginx.conf

# Security Headers und Permissions
RUN chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx-app:nginx-app /usr/share/nginx/html && \
    chown -R nginx-app:nginx-app /var/cache/nginx && \
    chown -R nginx-app:nginx-app /etc/nginx

# Switch zu non-root user
USER nginx-app

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]