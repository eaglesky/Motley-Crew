class AddIndexToQuest < ActiveRecord::Migration
  def change
    add_index :quests, :quester_id
    add_index :quests, :quest_giver_id
  end
end
