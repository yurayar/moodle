class DashboardController < ApplicationController
  def index
    @users = User.all
    @lectures = Lecture.all
    @teachers = Teacher.all
    @user = current_user
  end
end
