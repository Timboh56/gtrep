class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user
  attr_accessible :answer_id, :answers, :questions, :question_id, :user_id
  using_access_control
  
end
