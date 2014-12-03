class AddCompletedToRoles < ActiveRecord::Migration
  def change
    add_column :quest_roles, :completed, :boolean
  end
end
