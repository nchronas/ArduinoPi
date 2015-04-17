from flask import Flask, request, redirect

app = Flask(__name__)
@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
	"""Respond to incoming calls with a simple text message."""
	sms = request.args.get('Body')
	if not sms == "":
		speakSpeechFromText(sms)
	resp = twilio.twiml.Response()
	#resp.message("Hello, Mobile Monkey")
	return str(resp)

if __name__ == "__main__":
	print "Hello Arduino"
	app.run( host='0.0.0.0', debug=True, port = 80)
