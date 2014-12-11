class BuildsController < ApplicationController
  def index
    # @builds = User.find(session[:user_id]).builds.sort
    # TODO: session doesn't hold a user_id, and this is a horrid hack
    # on my end to get this plugged in
    @builds = User.find(2).builds
  end

  def show
  end

  def new
  end

  def edit
  end
end
