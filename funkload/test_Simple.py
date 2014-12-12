# -*- coding: iso-8859-15 -*-
"""Simple FunkLoad test

$Id$
"""

import pdb

import unittest
from random import random, randint
from funkload.FunkLoadTestCase import FunkLoadTestCase
from funkload.utils import extract_token
from funkload.Lipsum import Lipsum

import socket
socket.setdefaulttimeout(10)
from math import ceil

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
        source = Lipsum().getAddress()
        destination = Lipsum().getAddress()
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
        sorted_url = server_url + "/quests?direction=asc&sort=quest_giver_id"
        self.get(sorted_url, description="Sort by quest giver")
        test_arrow_up = 'Quest Giver <img alt="Arrow up"'
        self.assert_(test_arrow_up in self.getBody(), "Error when sorting by quest giver")

        # Test basic search (by title)
        basic_search_title = Lipsum().getUniqWord(length_min=1, length_max=10)
        self.get(sorted_url + "&search=" + basic_search_title, 
          description="Search for " + basic_search_title + " in title")

        # Test advanced search
        self.get(server_url + "/new_search", description="Get advanced search page")
        self.assert_("Title contains" in self.getBody(), "Error when loading advanced-search page")

        search_title = Lipsum().getUniqWord(length_min=1, length_max=10)
        search_source = Lipsum().getAddress()
        search_destination = Lipsum().getAddress()
        search_reward_min = randint(1, 10000)
        search_reward_max = randint(search_reward_min, 10000)
        self.get(server_url + "/quests",
        params=[['session[title]', search_title],
        ['session[source]', search_source],
        ['session[destination]', search_destination],
        ['session[reward_min]', search_reward_min], 
        ['session[reward_max]', search_reward_max],
        ['commit', 'Search']],
        description="Do a new advanced search")
        self.assert_("Search in title" in self.getBody(), "Wrong quest page")

        # Test selecting a quest on a random page and viewing its content
        self.get(server_url + "/quests", description="Go back to the basic quest browsing page")
        quest_total = extract_token(self.getBody(), '<h3>Quests (', ')')
        quest_total_num = int(quest_total)
        pages_total_num = int(ceil(quest_total_num / 10.0))
        page_num = randint(1, pages_total_num)
        self.get(server_url + "/quests?page=" + str(page_num), 
            description="Get the random page (page " + str(page_num) +")")

        assert_active_str = '<li class="active"><a href="/quests?page='+str(page_num)
        if page_num == 1 :
            assert_active_str = '<li class="active"><a rel="start" href="/quests?page=1'
        self.assert_(assert_active_str in self.getBody(),
         "Error when switching to page " + str(page_num))

        quest_id_path = extract_token(self.getBody(), 'onclick="location.href=', '"')
        quest_id_path = quest_id_path[1:-1]
        self.get(server_url + quest_id_path, description="Select the topest quest on the current page")



        # Test user log-out
        self.get(server_url + "/logout",params=[['authenticity_token', auth_token_quest]],
            description="Test user log-out")
        self.assert_("Sign up now!" in self.getBody(), "Not the root page after user logged out")
        self.assert_("Log in" in self.getBody(), "Not the root page after user logged out")


        # Test user log-in
        self.get(server_url + "/login", description="Get log-in url")
        self.assert_("New user?" in self.getBody(), "Not the log-in page")
        self.post(self.server_url + "/login",
        params=[ 
          ['session[email]', email],
          ['session[password]', '12345678'],
          ['authenticity_token', auth_token],
          ['commit', 'Log in']],
        description="User logs in")
        
        # Check if the user sucessfully logs in
        self.assertEquals(self.getLastUrl(), "/profile", "Is not user profile page")
        self.assert_(name in self.getBody(), "Wrong profile page")

if __name__ in ('main', '__main__'):
    unittest.main()
