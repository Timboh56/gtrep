class QuestionAnswers < ActiveRecord::Base
  attr_accessible :answer_id, :question_id
  belongs_to :question
  belongs_to :answer
end