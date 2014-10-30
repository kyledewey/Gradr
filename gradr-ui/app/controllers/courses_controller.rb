class CoursesController < ApplicationController
  # Login
  def new
  end

  def create
    
  end

  # Logout
  def destroy
      session[:user_id] = nil
  end
end
