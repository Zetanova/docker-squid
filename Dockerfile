FROM ubuntu:24.04
ARG SQUID_VERSION
ENV TZ=UTC

#RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
#RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

RUN apt-get update && apt-get -y install \
    "squid-openssl=${SQUID_VERSION}-*" \
    ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

#USER proxy

EXPOSE 3128 3129
VOLUME [/var/log/squid /var/spool/squid]

ENTRYPOINT ["entrypoint.sh"]
CMD ["-f", "/etc/squid/squid.conf", "-NYC"]