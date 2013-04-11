class Question < ActiveRecord::Base
  attr_accessible :category_id, :text, :type, :question_type, :answers, :open
  belongs_to :categories
  belongs_to :question_groups
  has_many :answers, :through => :questions_answers, :dependent => :destroy
  has_many :question_group_questions, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  using_access_control
end
