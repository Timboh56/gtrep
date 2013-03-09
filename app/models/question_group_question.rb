class QuestionGroupQuestion < ActiveRecord::Base
  attr_accessible :question_group_id, :question_id
  belongs_to :question
  belongs_to :question_group
end
