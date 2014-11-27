class CreateAdvancedSearches < ActiveRecord::Migration
  def change
    create_table :advanced_searches do |t|
      t.string :title
      t.string :reward_min
      t.string :reward_max
      t.string :quest_giver_name
 

      t.timestamps
    end
  end
end
