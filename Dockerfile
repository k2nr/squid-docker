FROM debian:jessie

RUN apt-get update && apt-get install -y squid3 && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/squid3/access.log
RUN ln -sf /dev/stdout /var/log/squid3/store.log
RUN ln -sf /dev/stdout /var/log/squid3/cache.log

COPY squid.conf /etc/squid3/squid.conf
COPY run.sh /run.sh

EXPOSE 3128

CMD ["/run.sh"]
