ARG ALPINE_VERSION=3.10.2

FROM alpine:3.10.2 as prod

MAINTAINER ops@newsletter2go.com

ARG POSTFIX_VERSION=3.4.7-r0

RUN apk add --no-cache --update \
    postfix=$POSTFIX_VERSION \
    ca-certificates

COPY .docker/ /
RUN chmod -R 644 /etc/postfix

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postfix", "start"]
