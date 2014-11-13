class AssignmentsController < ApplicationController
  def index
    @courses = User.find(session[:user_id]).courses
  end

  def new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    raise "exception"
  end

  # Logout
  def destroy

  end
end
