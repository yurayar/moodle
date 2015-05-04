class AddLectureIdToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :lecture_id, :integer
  end
end
