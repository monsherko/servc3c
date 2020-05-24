FROM alpine:3.10

# Install packages


RUN apk -U --no-cache add \
            automake \
            build-base \
            git \
            libcap \
            libtool \
            tor \
            python3-dev && \
  pip3 install --no-cache-dir --upgrade pip && \
            pip3 install --no-cache-dir  Flask


COPY . /etc/


RUN echo "HiddenServiceDir /var/lib/tor/servc3c" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 127.0.0.1:8080" >> /etc/tor/torrc
RUN service tor restart

ENTRYPOINT  cd /etc/servc3c && python3 c3server.py
