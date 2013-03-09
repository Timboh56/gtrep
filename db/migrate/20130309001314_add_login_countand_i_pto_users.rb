class AddLoginCountandIPtoUsers < ActiveRecord::Migration
  def up
    add_column :users, :login_count, :integer, :default => 0
    add_column :users, :login_ip, :string 
  end

  def down
    remove_column :users, :login_count
    remove_column :users, :login_ip
  end
end
