from flask import Flask, request
from twilio.rest import Client
import os
from os.path import join, dirname
from dotenv import load_dotenv
 
dotenv_path = join(dirname(__file__), '.env')
load_dotenv(dotenv_path)
 
# Accessing variables.
ACCOUNT_SID = os.getenv('ACCOUNT_SID')
AUTH_TOKEN = os.getenv('AUTH_TOKEN')
 
app = Flask(__name__)
 

 
client = Client(ACCOUNT_SID, AUTH_TOKEN)
 
@app.route('/sms', methods=['POST'])
def send_sms():
    message = client.messages.create(
        to=request.form['To'], 
        from_='16093364149', 
        body=request.form['Body'],
    )

    return message.sid

if __name__ == '__main__':
        app.run()

#curl -XPOST --data "To=4159609350&Body=Test message" http://127.0.0.1:5000/sms