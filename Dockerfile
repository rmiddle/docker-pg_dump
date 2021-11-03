FROM postgres:14
MAINTAINER Robert Middleswarth <72569+rmiddle@users.noreply.github.com> # Previously Cristoffer Fairweather <cfairweather@annixa.com>, Bruno Luiz <contact@brunoluiz.net>

RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD dump.sh /dump.sh
RUN chmod +x /dump.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /dump

ENTRYPOINT ["/start.sh"]
CMD [""]
