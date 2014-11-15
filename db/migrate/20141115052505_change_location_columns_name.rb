class ChangeLocationColumnsName < ActiveRecord::Migration
  def change
    rename_column :delivery_quests, :source_id, :source
    rename_column :delivery_quests, :destination_id, :destination 
  end
end
