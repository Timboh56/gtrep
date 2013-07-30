FactoryGirl.define do
  
  factory :category do
    name "Category 1"
  end
  
  factory :question do
    text "What is your name?"
    category
    question_type 1
    open true
  end
  
  
end