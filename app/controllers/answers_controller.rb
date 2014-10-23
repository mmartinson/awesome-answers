class AnswersController < ApplicationController
  before_action :find_categories

  def create
    @question = Question.find params[:question_id]
    @answer = Answer.new answer_params
    @answer.question = @question
    if @answer.save
      redirect_to @question, notice: "Answer created"
    else
      flash.now[:alert] = "FAIL"
      render "questions/show"
    end
  end 

  def edit
  end

  def update
  end

  def destroy
    @answer = Answer.find params[:id]
    @question = Question.find params[:question_id]
    if @answer.destroy
      flash[:notice] = "Answer Deleted"
    else
      flash[:alert] = "Problem deleting question"
    end
    redirect_to @question
  end

  private 

  def answer_params 
    params.require(:answer).permit(:body)
  end
end
