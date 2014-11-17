require 'test_helper'

class DeliveryQuestTest < ActiveSupport::TestCase


=begin
  test "Quest should not save without a quest_giver" do
    quest = DeliveryQuest.new
    assert_not quest.save
  end

  test "Quest should save when proper fields are present" do
    quest = DeliveryQuest.new
    quest.quest_giver_id = 1
    quest.title = "Pizza for me!"
    quest.reward = "Money"
    quest.description = "Bring me a pizza"
    quest.source_id = 1
    quest.destination_id = 1

    assert quest.save
  end

=end

end
