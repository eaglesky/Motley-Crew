class ChangeQuestRewardLimit < ActiveRecord::Migration
  def change
    change_column :quests, :reward, :integer, :limit => 8
  end
end
