class CreateDeliveryQuests < ActiveRecord::Migration
  def change
    create_table :delivery_quests do |t|
      t.string :title
      t.text :description
      t.string :reward
      t.references :quest_giver_id
      t.references :quester_id
      t.references :source_id
      t.references :destination_id

      t.timestamps
    end
  end
end
