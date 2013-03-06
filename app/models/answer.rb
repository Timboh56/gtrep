class Answer < ActiveRecord::Base
  belongs_to :questions
  attr_accessible :right, :text, :type
end
