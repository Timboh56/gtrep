class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user
  belongs_to :question_group
  attr_accessible :answer_id, :answers, :questions, :question_id, :user_id, :question_group_id, :questiongroup
  using_access_control
end
