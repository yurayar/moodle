class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:  [:edit, :update, :destroy, :create, :new]
  # GET /teachers
  def index
    @teachers = Teacher.all
    @lector = Lecture.find_by_teacher_id(__id__)
    @users = User.all
  end

  # GET /teachers/1
  def show
  end

  # GET /teachers/new
  def new
    if current_user.admin?
      @teacher = Teacher.new
    else
      redirect_to root_path
    end
  end

  # GET /teachers/1/edit
  def edit
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

  # POST /teachers
  def create
    if current_user.admin?
      @teacher = Teacher.new(teacher_params)

      if @teacher.save
        redirect_to @teacher, notice: 'Teacher was successfully created.'
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if current_user.admin?
      if @teacher.update(teacher_params)
        redirect_to @teacher, notice: 'Teacher was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /teachers/1
  def destroy
    if current_user.admin?
      @teacher.destroy
      redirect_to dashboard_path, notice: 'Teacher was successfully destroyed.'
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:name, :lecture_id, :degree, :id)
    end
end
