class ChangeLocationColumns < ActiveRecord::Migration
  def change
    change_column :delivery_quests, :source_id, :string
    change_column :delivery_quests, :destination_id, :string

  end
end
