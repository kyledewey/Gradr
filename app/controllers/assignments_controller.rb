class AssignmentsController < ApplicationController
  # Login
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      if @user.github_linked?
        redirect_to root_path
      else
        redirect_to "/users/oauth_github/1/#{@user.id}" # Refactor this with path helpers.
      end
    else
      flash[:login_error] = "Unknown username/password combination."
    end
  end

  # Logout
  def destroy
      session[:user_id] = nil
  end
end
