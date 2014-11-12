class AddFieldsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :name, :string
    add_column :courses, :description, :string
    add_column :courses, :website, :string
    add_column :courses, :start_date, :datetime
    add_column :courses, :end_date, :datetime
  end
end
