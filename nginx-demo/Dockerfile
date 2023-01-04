FROM nginx:1.22-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

ENV DEPLOY_ENV prod

EXPOSE 9999
WORKDIR /etc/nginx

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]