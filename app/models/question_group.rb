class QuestionGroup < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id
  belongs_to :user
  has_many :question_group_questions
  has_many :questions, :through => :question_group_questions
end
