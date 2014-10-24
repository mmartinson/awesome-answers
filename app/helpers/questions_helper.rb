module QuestionsHelper
  def question_user_display(question)
    if question.user
      question.user.full_name 
    else
      "Unknown User"
    end
  end
end
