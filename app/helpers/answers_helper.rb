module AnswersHelper
  def answer_user_display(answer)
    if answer.user
      return answer.user.full_name unless answer.user.full_name == ''
      answer.user.email
    else
      "Unknown User"
    end
  end
end
