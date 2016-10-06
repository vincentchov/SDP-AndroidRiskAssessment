from riskapp import app, api, auth


@app.route('/hello')
def hello_world():
	return 'Hello, World!'
