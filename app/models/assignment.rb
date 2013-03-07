class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  attr_accessible :user_id, :role_id
  using_access_control
  
end