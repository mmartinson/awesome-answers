class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_answer

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.answer = @answer
    if @favourite.save
      redirect_to :back, notice: "Answer favourited"
    else
      redirect_to :back, alert: "Cannot favourite"
    end
  end

  def destroy
    Favourite.destroy params[:id]
    redirect_to @answer.question, notice: 'Answer unfavourited'
  end

  private

  def get_answer
    @answer = Answer.find_by_id params[:answer_id]
  end
end
