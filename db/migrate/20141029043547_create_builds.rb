class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :commit_id
      t.integer :user_id
      t.integer :assignment_id
      t.integer :course_id
      t.timestamps
    end
  end
end
