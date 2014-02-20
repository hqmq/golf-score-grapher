Sequel.migration do
  change do
    create_table(:courses) do
      column :guid, "text"
      column :name, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
      
      index [:guid], :unique=>true
    end
    
    create_table(:players) do
      column :guid, "text"
      column :name, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
      
      index [:guid], :unique=>true
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20140126175129_create_players.rb')"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20140128055514_create_courses.rb')"
  end
end
