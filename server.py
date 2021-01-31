from flask import Flask, request
from twilio.rest import Client #pip install twilio
import os
from os.path import join, dirname
from dotenv import load_dotenv #pip install -U python-dotenv 
import httplib2
from bs4 import BeautifulSoup
from html.parser import HTMLParser
import re
import random
import math
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

@app.route('/quote', methods=['GET'])
def get_quotes():
    quote_tag = 'motivational'
    url = f'https://www.goodreads.com/quotes/tag/{quote_tag}'
    http = httplib2.Http()
    headers, body = http.request(url)
    soup = BeautifulSoup(body, "html.parser")
    
    
    cdata_all = soup.find_all(text=re.compile("CDATA"))
    for i in cdata_all:
        cdata = soup.find(text=re.compile("CDATA"))
        cdata.extract()

    list_of_quotes = []
    quotes = soup.find_all(class_="quoteText")
    for i in quotes:
        list_of_quotes.append(i.get_text().strip('\n').strip().replace("\n", "").replace("  ","").replace(' " ' , " ").replace(" ' " , " ").replace("-" , " "))
    randVal = math.floor(random.random()*len(list_of_quotes))
    print(list_of_quotes[randVal])
    dq = {"value": list_of_quotes[randVal]}
    return {"value": dq["value"].replace("\u201c", " ").replace("\u201d", " ").replace("\u2015", " ")}


if __name__ == '__main__':
        app.run()

#curl -XPOST --data "To=4159609350&Body=Test message" http://127.0.0.1:5000/sms