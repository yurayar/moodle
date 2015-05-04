class AddPhotoToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :annphoto, :string
  end
end
