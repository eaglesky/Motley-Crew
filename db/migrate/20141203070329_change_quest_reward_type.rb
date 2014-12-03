class ChangeQuestRewardType < ActiveRecord::Migration
  def change
    change_column :delivery_quests, :reward, :integer
  end
end
