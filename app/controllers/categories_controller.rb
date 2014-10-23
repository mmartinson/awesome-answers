class CategoriesController < ApplicationController
  before_action :find_categories

  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find params[:id]
    @questions = @category.questions || ["No questions for this category"]
  end  
end
