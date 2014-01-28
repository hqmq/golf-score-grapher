class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, :id => false do |t|
      t.string :guid, :limit => 40
      t.string :name
      t.timestamps
    end

    add_index :players, :guid, :unique => true
  end
end
