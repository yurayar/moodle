class AddTeacherIdToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :teacher_id, :integer
  end
end
