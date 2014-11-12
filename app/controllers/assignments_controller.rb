class AssignmentsController < ApplicationController
  # Login
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
