class Question < ActiveRecord::Base
  attr_accessible :category_id, :text, :type, :question_type, :answers, :open
  belongs_to :categories
  belongs_to :question_groups
  has_many :answers   
  using_access_control
end
