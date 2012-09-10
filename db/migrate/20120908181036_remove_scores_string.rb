class RemoveScoresString < ActiveRecord::Migration
  def up
    remove_column :games, :scores
    add_column :games, :num_holes, :integer
  end

  def down
    add_column :games, :scores, :string
    remove_column :games, :num_holes
  end
end
