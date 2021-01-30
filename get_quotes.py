import httplib2
from bs4 import BeautifulSoup
from html.parser import HTMLParser
import re


def main(quote_tag):
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
        list_of_quotes.append(i.get_text().strip('\n').strip().replace("\n", "").replace("  ",""))
    return list_of_quotes
if __name__ == "__main__":
    quote_tag = input("Enter tag for goodreads quote ('motivational', 'inspirational', 'funny'):")
    quotes = main(quote_tag)

    print(quotes)