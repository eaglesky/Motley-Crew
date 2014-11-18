class AddQuestCompleteFlag < ActiveRecord::Migration
  def change
    add_column :delivery_quests, :completed, :boolean, default: false
  end
end
