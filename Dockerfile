FROM alpine:3.10

RUN apk add --no-cache git bash
RUN apk add --update docker openrc docker-compose curl
RUN rc-update add docker boot

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]