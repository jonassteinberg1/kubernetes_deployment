import logging.config
import sys
import yaml

from flask import Flask, jsonify, request

def load_config():
    config_file_name = 'hello_world.config'
    with open(config_file_name, 'r') as file:
        config = yaml.safe_load(file)
    return config

config = load_config()

logging.config.dictConfig(config['logging'])
logger = logging.getLogger(__name__)

app = Flask(__name__)

@app.route("/api/v1/hello", methods=['POST'])
def hello():
    content = request.get_json()
    app.logger.info(f"content received: {content}")
    name = content.get('name')
    return jsonify({"hello": f"Hello, {name}"})

@app.route("/api/v1/healthz", methods=['GET'])
def healthz():
    return jsonify({"healthz": "alive"})

@app.route("/api/v1/readiness", methods=['GET'])
def readiness():
    return jsonify({"readiness": "ready"})

if __name__ == "__main__":
    app.run(debug=False)
