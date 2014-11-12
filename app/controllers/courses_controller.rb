class CoursesController < ApplicationController
  # Login
  def new
  	flash[:notice] = "You have successfully loaded new courses out."
  end
  
  def show
    @course = Course.find(params[:id])
  end

  def create
    #binding.pry
    @course = Course.new(course_params)
    @course.save
    flash[:notice] = "You have successfully created a course."
  end

  # Logout
  def destroy
      session[:user_id] = nil
  end


private
  def course_params
    params.require(:course).permit(
      :name,
      :start,
      :end,
      :website,
      :description,
    )
  end
end