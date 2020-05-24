FROM ubuntu:19.10
MAINTAINER r3dlacker
# Include dist

# Install packages
RUN apt-get update -y && apt-get upgrade -y \
&&  apt-get install git tor python3 python3-pip -y \
&& mkdir /var/lib/tor/servc3c

COPY /etc/servc3c/resources/servc3c/authorized_clients /var/lib/tor/authorized_clients
COPY /etc/servc3c/resources/servc3c/hostname /var/lib/tor/hostname
COPY /etc/servc3c/resources/servc3c/hs_ed25519_secret_key /var/lib/tor/hs_ed25519_secret_key
COPY /etc/servc3c/resources/servc3c/hs_ed25519_public_key /var/lib/tor/hs_ed25519_public_key

COPY resources/torrc /etc/tor/torrc
COPY resources/servc3c /var/lib/tor/
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir   Flask   requests


RUN cd /etc/ && \
    git clone --depth=1 https://github.com/monsherko/servc3c.git

EXPOSE 443

COPY resources/maestro.sh /etc/
# Start elasticpot
STOPSIGNAL SIGINT
USER root:root
WORKDIR /etc/servc3c/

ENTRYPOINT ["/usr/bin/sh","/etc/maestro.sh", "0.0.0.0", "443"]
