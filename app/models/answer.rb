class Answer < ActiveRecord::Base
  belongs_to :questions
  attr_accessible :right, :text, :type
  using_access_control
  
end
