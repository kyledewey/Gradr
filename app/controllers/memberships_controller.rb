class MembershipsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
  end

  def create
  end
end
