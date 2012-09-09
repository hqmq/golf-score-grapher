class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :game_id
      t.integer :player_id

      t.integer :hole01
      t.integer :hole02
      t.integer :hole03
      t.integer :hole04
      t.integer :hole05
      t.integer :hole06
      t.integer :hole07
      t.integer :hole08
      t.integer :hole09
      t.integer :hole10
      t.integer :hole11
      t.integer :hole12
      t.integer :hole13
      t.integer :hole14
      t.integer :hole15
      t.integer :hole16
      t.integer :hole17
      t.integer :hole18

      t.timestamps
    end
  end
end
