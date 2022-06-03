from flask import Flask
from flask import request ##Library for HTTP request to API
import requests
from lxml import html ## Library for html parsing


app = Flask(__name__)


@app.route("/")


# Simple Web App for fetching content from wikipedia
# And returns its wordlist

def index():
    url = request.args.get("url","")
    if url:
        content = fetch_wordlist(url) 
    else:
        content = ""
    return ( ## Button and texbox for taking a path from user
        """<h1>Enter wikipedia page name for fetching its wordlist</h1>
           <form action="" method="get">
                <input type="text" name="url" />
                <input type="submit" value="Bring word list" />
           </form>"""
        +"Content: "
        + content
    )

# Sending a request to wikipedia API with given parameters
def fetch_wordlist(url):
    response = requests.get(
    'https://en.wikipedia.org/w/api.php',
    params={
        'action': 'parse',
        'page': url,
        'format': 'json',
        'prop' : 'wikitext'
    }).json()
    # Parsing the raw html 
    raw_html = response['parse']['wikitext']['*']
    document = html.document_fromstring(raw_html)
    first_p = document.xpath('//p')[0]
    intro_text = first_p.text_content()
    return intro_text


if __name__ == "__main__":
    app.run(debug=True)
