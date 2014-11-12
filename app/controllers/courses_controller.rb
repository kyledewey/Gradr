class CoursesController < ApplicationController
  # Login
  def new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create

  end

  # Logout
  def destroy
      session[:user_id] = nil
  end
end
