class Lecture < ActiveRecord::Base
  has_many :announcements
  has_many :articles
  belongs_to :teacher
end
