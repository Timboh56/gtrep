class Question < ActiveRecord::Base
  belongs_to :answer
  belongs_to :categories
  attr_accessible :text, :type
end
