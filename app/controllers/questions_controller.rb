class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :show]
  before_action :find_question, only: [:show, :update, :edit, :destroy]

  def index
    @questions=Question.recent
  end

  def create
    @question = Question.new question_params
    if @question.save 
      # flash[:notice]= "Question saved"
      # redirect_to question_path(@question)
      redirect_to @question, notice: "Question saved successfully"  #this is a shortcut for the two commented lines
    else
      flash.now[:alert] = "Please correct errors below"
      render :new
    end 
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy  
      flash[:notice] = "Question deleted"
      redirect_to root_path
    else
      flash.now[:alert] = "Question could not be deleted"
      redirect_to root_path
    end
  end

  private

  def find_question
    @question = Question.find params[:id]
  end
  
  def question_params
    params.require(:question).permit(:title, :description, :category_id)
  end
end


