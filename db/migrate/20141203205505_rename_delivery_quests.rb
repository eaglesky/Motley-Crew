class RenameDeliveryQuests < ActiveRecord::Migration
  def change
    rename_table :delivery_quests, :quests
  end
end
