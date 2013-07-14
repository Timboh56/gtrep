class AddActivatedandSaltToUsers < ActiveRecord::Migration
  def up
    add_column :users, :activated, :boolean
    add_column :users, :salt, :string
  end
end
