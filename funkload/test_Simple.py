# -*- coding: iso-8859-15 -*-
"""Simple FunkLoad test

$Id$
"""
import unittest
from random import random
from funkload.FunkLoadTestCase import FunkLoadTestCase
from funkload.utils import extract_token
from funkload.Lipsum import Lipsum
import pdb

class Simple(FunkLoadTestCase):
    """This test use a configuration file Simple.conf."""

    def setUp(self):
        """Setting up test."""
        self.server_url = self.conf_get('main', 'url')

    def test_critical_path(self):
        
        server_url = self.server_url
        
        self.get(server_url, description='Get root url')
        self.get(server_url + "/signup", description="Get sign-up url")
        
        auth_token = extract_token(self.getBody(), 'name="authenticity_token" type="hidden" value="', '"')
        email = Lipsum().getUniqWord() + "@" + Lipsum().getWord() + ".com"
#         email = 'test3@example.com'
        name = Lipsum().getWord()
        res = self.post(self.server_url + "/users",
        params=[ ['user[name]', name],
          ['user[email]', email],
          ['user[password]', hash(email)],
          ['user[password_confirmation]', hash(email)],
          ['authenticity_token', auth_token],
          ['commit', 'Create my account']],
        description="Create New User")
        print res, email
        self.assertEqual(res.code, 200)
        self.get(server_url + "/profile", description="View the profile page of the new user")
#         print self.getBody()
        
        self.get(server_url + "/login", description="Get log-in url")
        


if __name__ in ('main', '__main__'):
    unittest.main()
