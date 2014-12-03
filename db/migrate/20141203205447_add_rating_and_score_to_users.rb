class AddRatingAndScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ratings_total, :integer
    add_column :users, :ratings_count, :integer
    add_column :users, :score, :integer, { :default =>100 }
  end
end
