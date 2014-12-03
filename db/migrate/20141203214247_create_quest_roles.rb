class CreateQuestRoles < ActiveRecord::Migration
  def change
    create_table :quest_roles do |t|
      t.string :name
      t.integer :quest_id
      t.integer :user_id

      t.timestamps
    end

    remove_column :quests, :quester_id
  end
end
