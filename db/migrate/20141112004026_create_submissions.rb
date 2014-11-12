class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.timestamps
    end

    add_column :commits, :submission_id, :integer
  end
end
