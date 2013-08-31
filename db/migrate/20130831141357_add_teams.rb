class AddTeams < ActiveRecord::Migration
  def up
    add_column :games, :teams, :boolean
    add_column :players, :type, :string

    create_table :players_teams, id: false do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end

  def down
    remove_column :games, :teams
    remove_column :players, :type
    drop_table :players_teams
  end
end
