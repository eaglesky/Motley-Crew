require 'test_helper'

class QuestTest < ActiveSupport::TestCase

  test "Quest should not save without a quest_giver" do
    quest = Quest.new
    assert_not quest.save
  end

  test "Quest should save when proper fields are present" do
    quest = Quest.new
    quest.quest_giver = users(:michael)
    quest.title = "Pizza for me!"
    quest.reward = "Money"
    quest.description = "Bring me a pizza"
    quest.source = "Woodstocks"
    quest.destination = "San Clemente"

    assert quest.save
  end

end
