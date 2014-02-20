Sequel.migration do
  change do
    create_table :courses, :id => false do
      String :guid, :limit => 40
      String :name
      Time :created_at
      Time :updated_at
    end

    add_index :courses, :guid, :unique => true
  end
end
