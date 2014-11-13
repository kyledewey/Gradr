class BuildsController < ApplicationController
  def index
    @builds = User.find(session[:user_id]).builds.sort
  end

  def show
  end

  def new
  end

  def edit
  end
end
