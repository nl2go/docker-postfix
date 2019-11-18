[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nl2go/postfix)](https://hub.docker.com/repository/docker/nl2go/postfix/general)
[![Docker Pulls](https://img.shields.io/docker/pulls/nl2go/postfix)](https://hub.docker.com/r/nl2go/postfix)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/nl2go/docker-postfix)](https://hub.docker.com/repository/docker/nl2go/postfix/tags?page=1)

# Docker Postfix

Containerized [Postfix](http://www.postfix.org/) mail server.

## Configuration

This project heavily relies on the Postfix [default configuration](http://www.postfix.org/postconf.5.html).

Additional configuration may be mounted as volume if needed. Any `*.cf` files from `/etc/postfix/main.cf.d/` will be sequentially applied using `postconf -e <key>=<value>` command.

To apply custom configuration mount the config file in the [main.cf](http://www.postfix.org/postconf.5.html) format as volume:
```
docker run -d -p 2500:25 \
           -v /custom.cf:/etc/postfix/main.cf.d/10-custom.cf \
       nl2go/postfix
```
## Development

Run locally built image

    docker-compose run postfix

Rebuild image

    docker-compose build postfix

## Maintainers

- [build-failure](https://github.com/build-failure)

## License

See the [LICENSE.md](LICENSE.md) file for details
