FROM alpine:latest

COPY /docker-entry.sh /docker-entry.sh
COPY /docker-cmd.sh /docker-cmd.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add dcron yq curl openssh-client && rm -rf /var/cache/apk/*
RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]