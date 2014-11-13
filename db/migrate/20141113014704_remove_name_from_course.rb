class RemoveNameFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :name
  end
end
