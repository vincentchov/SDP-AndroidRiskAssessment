import logging
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_httpauth import HTTPTokenAuth, HTTPBasicAuth
from flask_restful import Api
from itsdangerous import TimedJSONWebSignatureSerializer as JWT

from flask import Flask

app = Flask(__name__)

"""
Database Config
"""
app.config['SQLALCHEMY_DATABASE_URL'] = 'sqlite:////db.sqlite'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True

app.config['SECRET_KEY'] = 'top secret!'

handler = RotatingFileHandler('riskapp.log', maxBytes=10000, backupCount=1)
handler.setLevel(logging.INFO)
app.logger.addHandler(handler)

api = Api(app)
db = SQLAlchemy(app)
auth = HTTPBasicAuth()
jwt = JWT(app.config['SECRET_KEY'], expires_in=3600)


import riskapp.views
