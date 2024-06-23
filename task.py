from flask import Flask , render_template

from datetime import datetime 

app = Flask(__name__)

@app.route ('/')

def currenttime():
    Ctime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return render_template("index.html",time=Ctime)

if __name__ == '__main__':
    app.run(debug=True)