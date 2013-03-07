class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :assignments
  has_many :users, :through => :assignments
  using_access_control
  
end
