#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json


from flask import Flask, request, jsonify

app = Flask(__name__)



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
                        default='443')
    parser.add_argument('-c'
                        "--cert",
                        type=str,
                        default='/etc/servc3c/resources/certs/cert.pem')
    parser.add_argument('-k'
                        "--key",
                        type=str,
                        default='/etc/servc3c/resources/certs/key.pem')

    args = parser.parse_args()

    app.run(debug=True,host=args.addr, port=args.port, ssl_context=(args.cert, args.key))

    try:
        DatabaseABC()


        with DatabaseABC() as bd:
             bd.execute(DatabaseABC._db_init_pulsebeat_tbl_())

    except:

        app.run(debug=True)
