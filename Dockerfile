FROM alpine:3.12

RUN set -x \
  && apk add --no-cache logrotate tini tzdata moreutils \
  && rm /etc/logrotate.conf && rm -r /etc/logrotate.d \
  && mv /etc/periodic/daily/logrotate /etc/.logrotate.cronjob

COPY start.sh /start.sh
RUN chmod +x /start.sh


# VOLUME ["root/var/logs"]

ENTRYPOINT ["tini", "-g", "--"]
CMD ["/start.sh"]

