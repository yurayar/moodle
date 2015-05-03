class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @users = User.all
      @lectures = Lecture.all
      @teachers = Teacher.all
      @user = current_user
    else
      redirect_to root_path
    end
  end
end
