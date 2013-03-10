class Question_group < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id
  belongs_to :user
  has_many :question_group_questions
  has_many :responses
  has_many :questions, :through => :question_group_questions
end

class QuestionGroup  < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id
  belongs_to :user
  has_many :question_group_questions
  has_many :responses
  has_many :questions, :through => :question_group_questions
end
