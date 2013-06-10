class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user
  belongs_to :question_group
  attr_accessible :answer_id, :answers, :questions, :question_id, :text, :user_id, :question_group_id, :correct, :questiongroup
  using_access_control
  scope :user_responses, lambda { |user_id| where('user_id = ?', user_id ) unless user_id.nil? }
end
