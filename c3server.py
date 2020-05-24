#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json

from flask_sslify import SSLify
from flask import Flask, request, jsonify
from OpenSSL import SSL
app = Flask(__name__)
sslify = SSLify(app)
context = ('/etc/servc3c/resources/certs/example.crt', '/etc/servc3c/resources/certs/example.key')

@app.route('/api/v1.0/tasks')
def get_tasks():
    try:
        with open("/etc/servc3c/resources/task.json") as f:
            data = json.load(f)

        return jsonify(data)
    except:
        return jsonify({"status": "404"})



if __name__ == "__main__":


    parser = argparse.ArgumentParser(description='command three control centr')

    parser.add_argument('-a',
                        "--addr",
                        type=str,
                        default='127.0.0.1')

    parser.add_argument('-p',
                        "--port",
                        type=str,
                        default='5000')
    parser.add_argument('-c'
                        "--certificate",
                        type=str,
                        default='/etc/servc3c/resources/certs/example.crt')
    parser.add_argument('-k'
                        "--key",
                        type=str,
                        default='/etc/servc3c/resources/certs/example.key')

    args = parser.parse_args()

    context = ('/etc/servc3c/resources/certs/example.crt', '/etc/servc3c/resources/certs/example.key')


    app.run(host=args.addr, port=args.port, ssl_context=context)
