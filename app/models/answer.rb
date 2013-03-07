class Answer < ActiveRecord::Base
  belongs_to :questions
  attr_accessible :correct, :text, :questions_id, :answer_type
  using_access_control
  
end
