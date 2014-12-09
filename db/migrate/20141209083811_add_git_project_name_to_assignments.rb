class AddGitProjectNameToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :git_project_name, :string
  end
end
