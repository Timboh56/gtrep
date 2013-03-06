class Question < ActiveRecord::Base
  attr_accessible :categories, :text, :type
  belongs_to :category
  has_many :answers
end
