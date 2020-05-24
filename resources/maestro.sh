#!/bin/bash

service tor start

/usr/bin/python3 c3server.py --addr $1 --port $2
