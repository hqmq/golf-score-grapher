class AddCourseIdToGame < ActiveRecord::Migration
   def up
    remove_column :games, :name
    add_column :games, :course_id, :integer
  end

  def down
    add_column :games, :name, :string
    remove_column :games, :course_id
  end
end
