FROM alpine:latest

RUN apk add --no-cache nginx && \
    mkdir -p /www/html && \
    chown -R nginx:nginx /www

RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

USER nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY static /www/html

VOLUME /www/html

CMD ["nginx", "-g", "daemon off;"]
