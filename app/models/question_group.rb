class QuestionGroup  < ActiveRecord::Base
  attr_accessible :name, :question_groups_type, :user_id,  :question_group_questions, :open, :questions
  belongs_to :user
  has_many :question_group_questions
  has_many :responses
  has_many :questions, :through => :question_group_questions
  validates :name, :uniqueness => true
  validates_associated :questions
  scope :open_question_groups, where(:open => true)
  accepts_nested_attributes_for :question_group_questions
  
end
