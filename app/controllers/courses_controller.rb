class CoursesController < ApplicationController
  # Login
  def new
  	flash[:notice] = "You have successfully loaded new courses out."
  end

  def create
    flash[:notice] = "You have successfully created out."
    raise "exception"
  end

  # Logout
  def destroy
      session[:user_id] = nil
  end
end
