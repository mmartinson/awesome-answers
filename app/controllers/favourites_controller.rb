class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_answer

  def create
    favourite = @answer.favourites.new
    favourite.user = current_user
    # @favourite.answer = @answer  #needed only if forst line is instead `= Answer.new`
    if favourite.save
      redirect_to :back, notice: "Answer favourited"
    else
      redirect_to :back, alert: "Cannot favourite"
    end
  end

  def index
    @favourites = current_user.favourites
  end

  def destroy
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to @answer.question, notice: 'Answer unfavourited'
  end

  private

  def get_answer
    @answer = Answer.find_by_id params[:answer_id]
  end
end
