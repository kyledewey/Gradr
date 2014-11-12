class Course < ActiveRecord::Base
    has_many :memberships
    has_many :assignments
end
