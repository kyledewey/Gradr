class CoursesController < ApplicationController
  def index
  end

  # Login
  def new
    @course = Course.new
  	flash[:notice] = "You have successfully loaded new courses out."
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    @course.save
    flash[:notice] = "You have successfully created a course."
    redirect_to root_path
  end

  # Logout
  def destroy
      session[:user_id] = nil
  end


private
  def course_params
    params.require(:course).permit(
      :title,
      :start_date,
      :end_date,
      :website,
      :description,
    )
  end
end
