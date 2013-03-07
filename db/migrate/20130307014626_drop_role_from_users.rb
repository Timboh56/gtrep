class RemoveRoleFromUsers < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :users, :role
  end
end
