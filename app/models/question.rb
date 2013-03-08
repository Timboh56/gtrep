class Question < ActiveRecord::Base
  attr_accessible :category_id, :text, :type, :question_type, :answers
  belongs_to :categories
  has_many :answers
  using_access_control
  
end
