from flask import Flask , render_template , jsonify

from datetime import datetime 
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)


@app.route ('/')

def currenttime():
    Ctime = datetime.now().strftime("Day [ %d/%m/%Y ] ---- Hour[ %H:%M:%S ]")
    return render_template("index.html",time=Ctime)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000, debug=True)