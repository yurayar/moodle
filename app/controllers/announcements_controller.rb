class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:edit, :update, :destroy, :create, :new]

  # GET /announcements
  def index
    @announcements = Announcement.all
  end

  # GET /announcements/1
  def show
  end

  # GET /announcements/new
  def new
    if current_user.admin?
      @announcement = Announcement.new
    else
      redirect_to root_path
    end
  end

  # GET /announcements/1/edit
  def edit
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

  # POST /announcements
  def create
    if current_user.admin?
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        redirect_to announcements_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /announcements/1
  def update
    if current_user.admin?
      if @announcement.update(announcement_params)
        redirect_to @announcement, notice: 'Announcement was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /announcements/1
  def destroy
    if current_user.admin?
      @announcement.destroy
      redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def announcement_params
      params.require(:announcement).permit(:content, :title, :lecture_id, :annphoto)
    end
end
