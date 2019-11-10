FROM alpine:3.10.2 as prod

MAINTAINER ops@newsletter2go.com

RUN apk add --no-cache --update \
    postfix \
    ca-certificates

COPY .docker/ /
RUN chmod -R 644 /etc/postfix

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postfix", "start"]
