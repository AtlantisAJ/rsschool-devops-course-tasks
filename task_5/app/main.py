from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Task 5 Flask app in Kubernetes"
