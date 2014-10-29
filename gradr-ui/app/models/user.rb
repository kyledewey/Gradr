class User < ActiveRecord::Base
  has_secure_password
  has_many :memberships

  attr_accessor :first_name,
                :last_name,
                :email,
                :github_username,
                :password,
                :password_confirmation

  def self.authenticate(email, password)
    if user = User.find_by_email(email)
      user.authenticate(password)
    else
      user.errors[:authentication_error] = "Invalid username/password combination."
    end
  end
end
