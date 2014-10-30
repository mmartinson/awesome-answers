module ApplicationHelper
  def favourite(answer)
    Favourite.where(answer_id: answer).find_by_user_id(current_user.id)
  end 
end
