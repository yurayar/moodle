class LecturesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :set_lecture, only: [:show, :new, :edit, :update, :destroy]

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
      @lecture = Lecture.new
  end

  def anncount
    if @lecture.ann_count.nil?
      @lecture.ann_count = 0
    end
    @lecture.save
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  def create
      @lecture = Lecture.new(lecture_params)

    if @lecture.save
      redirect_to lectures_path
    else
      render :new
    end
  end

  # PATCH/PUT /lectures/1
  def update
    if @lecture.update(lecture_params)
      redirect_to @lecture, notice: 'Lecture was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lectures/1
  def destroy
    @lecture.destroy
    redirect_to lectures_url, notice: 'Lecture was successfully destroyed.'
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
