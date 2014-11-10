class Build < ActiveRecord::Base
  belongs_to :commit
  belongs_to :user
  belongs_to :assignment
  belongs_to :course
end
