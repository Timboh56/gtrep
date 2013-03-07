class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user
  # attr_accessible :title, :body
end
