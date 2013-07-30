class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :questions
  using_access_control
  validates_presence_of :name
end
