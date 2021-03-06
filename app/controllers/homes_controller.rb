class HomesController < ApplicationController
  def show
    @announcements = Announcement.all
    @teachers = Teacher.all
    @lectures = Lecture.all
    @lectures.each do |lect|
      lect.ann_count=lect.announcements.size
      lect.save
    end
    @announcements.each do |announce|
      @content = announce.content.html_safe
    end
    @anncont = Announcement.select(:content)
    @vidid = "http://www.youtube.com/embed/nA1Aqp0sPQo?autoplay=0&showinfo=0&modestbranding=1&fs=1"
    @user = current_user
    @q = Lecture.ransack(params[:q])
    @lectures = @q.result(distinct: true)
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
