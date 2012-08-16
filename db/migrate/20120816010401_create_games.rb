class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :played_at
      t.text :scores

      t.timestamps
    end
  end
end
