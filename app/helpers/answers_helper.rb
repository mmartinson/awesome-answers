module AnswersHelper
  def answer_user_display(answer)
    if answer.user
      answer.user.full_name
    else
      "Unknown User"
    end
  end
end
