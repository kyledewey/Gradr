class AddFieldsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :course_id, :integer
    add_column :assignments, :title, :string
    add_column :assignments, :number, :string
    add_column :assignments, :due_date, :datetime
    add_column :assignments, :assignment_text, :string
  end
end
