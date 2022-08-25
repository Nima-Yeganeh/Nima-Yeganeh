import flask
from flask import request, jsonify, Response
import json
import netprog

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET', 'POST'])
def root():
    return Response(json.dumps({
        "status": True,
        "message": "Forbidden"
    }, indent=4), status=403, mimetype='application/json')

@app.route('/config/access-port', methods=['POST'])
def access_port():
    input = request.json
    success = []
    failed = []

    for ip in input:
            commands = netprog.access_port_config(input[ip])
            print(ip)
            print(json.dumps(commands, indent=4))
            device = netprog.get_devices('access', ip)
            if netprog.send_config(device, commands) == True:
                success.append(ip)
            else:
                failed.append(ip)

    result = {
        'status': 'done',
        'success': success,
        'failed': failed
    }
    return Response(json.dumps(result, indent=4), status=200, mimetype='application/json')

app.run()