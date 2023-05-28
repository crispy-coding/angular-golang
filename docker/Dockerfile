FROM nginx:stable-alpine3.17-slim
COPY build-context/frontend /usr/share/nginx/html
COPY build-context/backend /usr/bin/backend
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
EXPOSE 80
CMD ["/entrypoint.sh"]