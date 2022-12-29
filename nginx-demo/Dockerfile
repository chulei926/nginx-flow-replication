FROM nginx:1.22-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

EXPOSE 9999
ENTRYPOINT nginx -g 'daemon off;'
