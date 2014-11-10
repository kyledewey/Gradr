class Commit < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :user
  
  has_many :builds
end
