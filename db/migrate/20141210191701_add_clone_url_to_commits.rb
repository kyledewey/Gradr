class AddCloneUrlToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :clone_url, :string
  end
end
