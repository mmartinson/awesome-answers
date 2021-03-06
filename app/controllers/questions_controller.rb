class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :show]
  before_action :find_question, only: [:show, :update, :edit, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @questions=Question.recent
  end

  def create
    @question = Question.new question_params
    @question.user = current_user
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
    @like = @question.like_for(current_user) if user_signed_in?
    #maybe don't need this because this has to be processed in helper, which can call the db itself
    #but is used to easily display number of fav's per question
    @favourites = Favourite.where(answer_id: @question.answers) #all favourites that belond to @question
  end

  def new
    @question = Question.new
  end

  def edit; end

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

  def check_permissions 
    redirect_to root_path, alert: "Access Denied" unless current_user == @question.user
  end
end


