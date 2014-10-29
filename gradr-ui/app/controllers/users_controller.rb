require 'rest-client'

class UsersController < ApplicationController
  CLIENT_ID = ENV["GRADR_CLIENT_ID"]
  CLIENT_SECRET = ENV["GRADR_CLIENT_SECRET"]
  DOMAIN_NAME = "http://highermindedtypes.com"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    binding.pry

    if @user.save
        render text: "Success!"
    else
      flash = @user.errors
      redirect_to new_user_path
    end
  end

  # No way to destroy a user.
  def destroy; end

  def initialize_oauth_github_flow
    # support passing of the state parameter
    query_string = "?client_id=#{CLIENT_ID}&redirect_uri=#{DOMAIN_NAME + "/users/oauth_github"}"
    redirect_to "https://github.com/login/oauth/authorize#{query_string}"
  end

  def complete_oauth_github_flow
    params = {
      code: params[:code],
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      redirect_uri: DOMAIN + "/works"
    }
    response = RestClient.post "https://github.com/login/oauth/access_token", params, accept: "application/json"
    binding.pry
  end

private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :password_digest,
      :github_username
    )
  end
end
