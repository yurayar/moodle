class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:edit, :update, :destroy, :create, :new]

  # GET /lectures
  def index
    @lectures = Lecture.all
    @teachers = Teacher.all
    @users = User.all
    @q = Lecture.ransack(params[:q])
    @lectures = @q.result(distinct: true)
    @list_user = @users.select{:email}
    @lectures.each do |lect|
      lect.ann_count=lect.announcements.size
      lect.save
    end
  end

  # GET /lectures/1
  def show
    @announcements = Announcement.all
    @ann_content = @lecture.announcements.select{:name}
  end

  # GET /lectures/new
  def new
    if current_user.admin?
      @lecture = Lecture.new
    else
      redirect_to root_path
    end
  end

  def anncount
    if @lecture.ann_count.nil?
      @lecture.ann_count = 0
    end
    @lecture.save
  end

  # GET /lectures/1/edit
  def edit
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

  # POST /lectures
  def create
    if current_user.admin?
      @lecture = Lecture.new(lecture_params)

    if @lecture.save
      redirect_to lectures_path
    else
      render :new
    end
    else
      redirect_to root_path
      end
  end

  # PATCH/PUT /lectures/1
  def update
    if current_user.admin?
      if @lecture.update(lecture_params)
        redirect_to @lecture, notice: 'Lecture was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /lectures/1
  def destroy
    if current_user.admin?
      @lecture.destroy
      redirect_to lectures_url, notice: 'Lecture was successfully destroyed.'
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lecture_params
      params.require(:lecture).permit(:name, :teacher_id, :announcement_id)
    end
end
