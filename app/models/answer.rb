class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :correct, :text, :questions_id, :answer_type, :questions
  using_access_control
  
end
