class AddMembershipFields < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :course_id, :integer
  end
end
