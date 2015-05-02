class DashboardController < ApplicationController
  def index
    @users = User.all
    @lectures = Lecture.all
    @teachers = Teacher.all
  end
end
