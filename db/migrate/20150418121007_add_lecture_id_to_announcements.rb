class AddLectureIdToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :lecture_id, :integer
  end
end
