class Announcement < ActiveRecord::Base
  belongs_to :lecture
  mount_uploader :annphoto, AnnPhotoUploader
  def conte
    self[:content].html_safe
  end
end
