class AddStatusResultsToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :status, :integer
    add_column :builds, :results, :string
  end
end
