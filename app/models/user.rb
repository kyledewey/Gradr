class User < ActiveRecord::Base
  has_secure_password
  has_many :memberships
  has_many :commits
  has_many :builds

  # def self.authenticate(email, password)
  #   if user = User.find_by_email(email)
  #     user.authenticate(password)
  #   else
  #     user.errors[:authentication_error] = "Invalid username/password combination."
  #   end
  # end

  def github_linked?
    User.access_token.non_blank?
  end

  def courses
    # FIXME: Not be bad
    self.memberships.map(&:course)
  end
end
