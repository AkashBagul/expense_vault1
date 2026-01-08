class UsersController < ApplicationController
  def create
    @user = User.new(user_params.merge(password_confirmation: user_params[:password], email: user_params[:email]&.downcase))

    if @user.save
      render :show, status: :created
    else
      render json: { status: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :name, :mobile_number)
  end
end
