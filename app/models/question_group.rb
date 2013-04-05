class Question_group < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id, :question_group_questions, :questions
  belongs_to :user
  has_many :question_group_questions, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  has_many :questions, :through => :question_group_questions, :dependent => :restrict
  accepts_nested_attributes_for :question_group_questions
  
end

class QuestionGroup  < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id,  :question_group_questions, :questions
  belongs_to :user
  has_many :question_group_questions
  has_many :responses
  has_many :questions, :through => :question_group_questions
  accepts_nested_attributes_for :question_group_questions
  
end
