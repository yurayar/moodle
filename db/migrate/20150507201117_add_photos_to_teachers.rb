class AddPhotosToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :tavatar, :string
    add_column :teachers, :tcover, :string
  end
end
