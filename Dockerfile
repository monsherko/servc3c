FROM ubuntu:19.10
MAINTAINER r3dlacker
# Include dist

# Install packages
RUN apt-get update -y && apt-get upgrade -y \
&&  apt-get install git tor python3 python3-pip -y \
&& mkdir /var/lib/tor/servc3c


RUN service tor start
COPY resources/torrc /etc/tor/torrc
COPY resources/servc3c /var/lib/tor/
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir   Flask   requests


RUN cd /etc/ && \
    git clone --depth=1 https://github.com/monsherko/servc3c.git

COPY resources/certs /etc/servc3c/resources/certs


USER root:root
COPY resources/maestro.sh /etc/maestro.sh
# Start elasticpot
STOPSIGNAL SIGINT



ENTRYPOINT ["/usr/bin/sh","/etc/maestro.sh"]
