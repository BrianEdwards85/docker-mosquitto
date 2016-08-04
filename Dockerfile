FROM ubuntu:16.04

MAINTAINER Thomas Kerpe <toke@toke.de>


RUN apt-get update && apt-get install -y mosquitto && \
    adduser --system --disabled-password --disabled-login mosquitto

RUN mkdir -p /mqtt/config 
COPY config /mqtt/config
RUN chown -R mosquitto:mosquitto /mqtt


EXPOSE 1883

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
