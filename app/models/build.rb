class Build < ActiveRecord::Base
  belongs_to :commit
  belongs_to :user
  belongs_to :assignment
  belongs_to :course

  def printable_results
    case self.status
    when 0 
      "Pending"
    when 1
      "In Progress"
    when 2
      "Done - " + self.results
    else
      "INVALID STATUS: " + self.status
    end
  end
  def results_pass
    if(self.results.include? "false")
      "danger"
    else
      "success"
    end
  end
end
