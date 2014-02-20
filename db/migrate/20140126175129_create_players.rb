Sequel.migration do
  change do
    create_table :players, :id => false do |t|
      String :guid, :limit => 40
      String :name
      Time :created_at
      Time :updated_at
    end

    add_index :players, :guid, :unique => true
  end
end
