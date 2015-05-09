class Teacher < ActiveRecord::Base
  has_many :lectures
  mount_uploader :tavatar, TavatarUploader
  mount_uploader :tcover, TcoverUploader
  belongs_to :user
end
