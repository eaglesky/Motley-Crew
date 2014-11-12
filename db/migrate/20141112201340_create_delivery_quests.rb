class CreateDeliveryQuests < ActiveRecord::Migration
  def change
    create_table :delivery_quests do |t|
      t.string :title
      t.text :description
      t.string :reward
      t.references :quest_giver
      t.references :quester
      t.references :source
      t.references :destination

      t.timestamps
    end
  end
end
