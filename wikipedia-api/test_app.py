
from flask import Flask
from flask import request
import requests
from lxml import html
import unittest

from app import app

#Unit test for our fething function
class AppTestCase(unittest.TestCase):
    #creating test environment 
    def setUp(self):
        self.ctx = app.app_context()
        self.ctx.push()
        self.client = app.test_client()

    #invoking the method after test runs
    def tearDown(self):
        self.ctx.pop()

    def test_fetch_wordlist(self):
        #sending an example parameter for unit testing
        response = self.client.get("/", data={"content": "hello world"}) 
        print(response.status_code)
        assert response.status_code == 200 # if it returns 200 it means test is valid

if __name__ == "__main__":
    unittest.main()