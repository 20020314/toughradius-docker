FROM freeradius/freeradius-server:latest

USER root
RUN apt-get update
RUN apt install -y net-tools vim tcpdump iproute2 && apt-get clean  && rm -r /var/lib/apt/lists/*

COPY freeradius/ /etc/raddb/
COPY lfreemate /usr/sbin/lfreemate
RUN chmod +x /usr/sbin/lfreemate
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["lfreemate"]