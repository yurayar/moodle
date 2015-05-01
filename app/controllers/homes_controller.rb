class HomesController < ApplicationController
  def show
    @lectures = Lecture.all
    @lectures.each do |lect|
      lect.ann_count=lect.announcements.size
      lect.save
    end
    @anncont = Announcement.select(:content)
    @videoid = "http://www.youtube.com/embed/nA1Aqp0sPQo?autoplay=0&showinfo=0&modestbranding=1&fs=1"
    @videosource = Article.find(2)
    @user = current_user
    @vidid = @videosource.content
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
