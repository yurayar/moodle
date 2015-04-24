class HomesController < ApplicationController
  def show
    @lectures = Lecture.all
    @announcements = Announcement.all.order(:created_at)
    @device = "others"
    respond_to do |format|

      format.html.phone do # phone variant
        # add code here for phones
      end

      format.html.tablet do # tablet variant
        # add code here for tablets
      end

      format.html.desktop do
        # add code here for desktops and other devices
      end
    end
  end
end
