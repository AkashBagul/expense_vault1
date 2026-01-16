class ExpensesController < ApplicationController
  before_action :set_expense, only: [ :show, :update, :destroy ]

  def index
    expenses = current_user.expenses.includes(:category)
    render json: { status: true, data: expenses }
  end

  def show
    render json: { status: true, data: @expense }
  end

  def create
    expense = current_user.expenses.new(expense_params)

    if expense.save
      render json: { status: true, data: expense }, status: :created
    else
      render json: { status: false, errors: expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      render json: { status: true, data: @expense }
    else
      render json: { status: false, errors: @expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    render json: { status: true, message: "Expense deleted successfully" }
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.permit(
      :title,
      :description,
      :amount,
      :spent_on,
      :payment_method,
      :category_id
    )
  end
end
