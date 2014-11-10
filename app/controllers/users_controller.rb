require 'rest-client'

class UsersController < ApplicationController
  CLIENT_ID = ENV["GRADR_CLIENT_ID"]
  CLIENT_SECRET = ENV["GRADR_CLIENT_SECRET"]
  DOMAIN_NAME = "http://highermindedtypes.com"
  AUTHORIZE_URL = "https://github.com/login/oauth/authorize"
  ACCESS_TOKEN_URL = "https://github.com/login/oauth/access_token"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
        flash[:message] = "Welcome!"
        redirect_to root_path
    else
      @user.errors.each { |k, v| flash[k] = "#{k}:#{v}" }
      redirect_to new_user_path
    end
  end

  # No way to destroy a user.
  def destroy; end

  # How to obtain an access key from GitHub.
  # TODO: Need to thread the state nonce through the API requests.
  # Better error handling
  def oauth_github_flow
    case params[:step]
    when 1
      oauth_github_flow_authorize
    when 2
      oauth_github_flow_access_token
    else
      raise "Unsupported OAuth step"
    end
  end

  def oauth_github_flow_authorize
    # support passing of the state parameter
    query_string = "?client_id=#{CLIENT_ID}&redirect_uri=#{DOMAIN_NAME + oauth_flow_step_path(2)}"
    redirect_to "#{AUTHORIZE_URL}#{query_string}"
  end

  def oauth_github_flow_access_token
    params = {
      code: params[:code],
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      redirect_uri: DOMAIN + "/works"
    }
    response = RestClient.post(ACCESS_TOKEN_URL, params, accept: "application/json")
    resp_data = JSON.parse(response.to_str)

    # this is currently not secure in the slightest
    # need to check scopes
    user = User.find(params) or raise "Invalid User"
    user.access_token = resp_data["access_token"]
    user.save!
  end

  def oauth_flow_step_path(step)
    case step
    when 1
      "/users/oauth_github/#{step}/1000"
    when 2
      "/users/oauth_github/#{step}/1000"
    else
      raise "Unsupported flow step."
    end
  end
private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
