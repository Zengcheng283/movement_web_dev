from crypt import methods
import json
from urllib import request
from flask import Flask
from flask_cors import cross_origin
import requests
app = Flask(__name__)

@app.route('/getData/info/<name>')
@cross_origin() # 跨域问题引入cors中间件
def getData(name):
    print('https://api.bilibili.com/x/relation/stat?vmid=%s'% name)
    url = 'https://api.bilibili.com/x/relation/stat?vmid=%s'% name
    response = requests.get(url)
    print(response.json())
    return response.json()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5590)
