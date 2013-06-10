class Answers::AnswersPresenter
  
  def initialize(answer = nil)
    @answer = answer.nil? ? all_answers : Answer.find(answer)
  end
  
  def all_answers
    @answers ||= Answer.all
  end
  
  def all_questions
    @questions ||= Question.all
  end
  
  def answers_question
    @question ||= Question.find(@answer.questions_id)
  end
  
  def answer
    @answer
  end

end