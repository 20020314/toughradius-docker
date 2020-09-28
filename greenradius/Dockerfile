FROM ubuntu

USER root
RUN apt-get update
RUN apt install -y net-tools vim tcpdump iproute2 curl && apt-get clean  && rm -r /var/lib/apt/lists/*


RUN curl https://greenradius-1251458486.cos.ap-shanghai.myqcloud.com/greenradius/greenradius-latest -o /greenradius
RUN chmod +x /greenradius
EXPOSE 1812/UDP 1813/UDP 1816
ENTRYPOINT ["/greenradius"]