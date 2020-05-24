FROM ubuntu:19.10
MAINTAINER r3dlacker
# Include dist

# Install packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install  tor -y

COPY torrc /etc/tor/torrc
COPY servc3c /var/lib/tor/


STOPSIGNAL SIGINT
USER root:root
WORKDIR /etc/servc3c/
ENTRYPOINT ["service", "tor", "start"]
