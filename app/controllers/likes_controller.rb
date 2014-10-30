class LikesController < ApplicationController
  before_action :authenticate_user!

  #for liking
  def create
    @question = Question.find params[:question_id]
    @like = @question.likes.new
    @like.user = current_user
    if @like.save
      redirect_to @question, notice: "Liked"
    else
      redirect_to @question, notice: "could not like"
    end
  end

  #for unliking
  def destroy
    @like = current_user.likes.find params[:id]
    @like.destroy
    @question = Question.find params[:question_id]
    redirect_to @question, notice: "Unliked"
  end

end
