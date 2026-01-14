class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :update, :destroy ]

  def index
    @categories = current_user.categories
  end

  def show
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      render :show, status: :created
    else
      render json: { status: false, errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: { status: true, data: @category }
    else
      render json: { status: false, errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    render json: { status: true, message: "Category deleted successfully" }
  end

  private

    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :monthly_limit)
    end
end
