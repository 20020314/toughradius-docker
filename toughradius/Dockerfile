FROM ubuntu

USER root
RUN apt-get update
RUN apt install -y net-tools vim tcpdump iproute2 curl && apt-get clean  && rm -r /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN curl -k https://gstatic.toughstruct.net/enterprise/toughradius-latest -o /usr/local/bin/toughradius

RUN chmod +x /usr/local/bin/toughradius

EXPOSE 1812/UDP 1813/UDP 1816

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["toughradius"]