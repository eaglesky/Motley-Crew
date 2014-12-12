# -*- coding: iso-8859-15 -*-
"""Simple FunkLoad test

$Id$
"""
import unittest
from random import random, randint
from funkload.FunkLoadTestCase import FunkLoadTestCase
from funkload.utils import extract_token
from funkload.Lipsum import Lipsum
import pdb
import socket
socket.setdefaulttimeout(10)

class Simple(FunkLoadTestCase):
    """This test use a configuration file Simple.conf."""

    def setUp(self):
        """Setting up test."""
        self.server_url = self.conf_get('main', 'url')

    def test_critical_path(self):
        
        server_url = self.server_url
        
        self.get(server_url, description='Get root url')

        # Test user sign-up
        self.get(server_url + "/signup", description="Get sign-up url")
        
        auth_token = extract_token(self.getBody(), 'name="authenticity_token" type="hidden" value="', '"')
        name = Lipsum().getUniqWord(length_min=1, length_max=20)
        maxLenMail = 250 - len(name)
        email = name + "@" + Lipsum().getUniqWord(length_min=1, length_max=maxLenMail) + ".com"
        
        self.post(self.server_url + "/users",
        params=[ ['user[name]', name],
          ['user[email]', email],
          ['user[password]', '12345678'],
          ['user[password_confirmation]', '12345678'],
          ['authenticity_token', auth_token],
          ['commit', 'Create my account']],
        description="Create New User")
 
        # Check if signing up succeeds
        self.assertEquals(self.getLastUrl(), "/profile", "Is not user profile page")
        self.assert_(name in self.getBody(), "Wrong profile page")

        # Test quest creation
        self.get(server_url + "/quests/new", description="Get new-quest page")

        auth_token_quest = extract_token(self.getBody(), 'name="authenticity_token" type="hidden" value="', '"')
        title = Lipsum().getSubject(uniq=True)
        description = Lipsum().getMessage()
        source = Lipsum().getSentence()
        destination = Lipsum().getSentence()
        reward = randint(1, 10000)

        self.post(self.server_url + "/quests",
        params=[ ['quest[title]', title],
          ['quest[description]', description],
          ['quest[source]', source],
          ['quest[destination]', destination],
          ['quest[reward]', reward],
          ['authenticity_token', auth_token_quest],
          ['commit', 'Create Quest']], 
        description="Create New Quest")

        # Check if quest creation succeeds
        self.assertEquals(self.getLastUrl(), "/profile", "Is not user profile page")
        self.assert_(name in self.getBody(), "Wrong profile page")

        # Test quest searching page
        self.get(server_url + "/quests", description="Get quests url")
        self.assert_("Quests" in self.getBody(), "Wrong quest page")
        self.assert_("Advanced Search" in self.getBody(), "Wrong quest page")
        self.assert_("Search in title" in self.getBody(), "Wrong quest page")

        # Test sorting (only on foreign key)
        self.get(server_url + "/quests?direction=asc&sort=quest_giver_id", 
          description="Sort by quest giver")
        test_arrow_up = 'Quest Giver <img alt="Arrow up"'
        self.assert_(test_arrow_up in self.getBody(), "Error when sorting by quest giver")

        self.get(server_url + "/login", description="Get log-in url")
        


if __name__ in ('main', '__main__'):
    unittest.main()
