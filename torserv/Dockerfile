FROM ubuntu:19.10
MAINTAINER r3dlacker
# Include dist

# Install packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install  tor -y

COPY resources/torrc /etc/tor/torrc
COPY resources/servc3c /var/lib/tor/


STOPSIGNAL SIGINT
USER root:root
WORKDIR /etc/servc3c/
CMD ["service", "tor", "start"]
