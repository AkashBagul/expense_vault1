class UsersController < ApplicationController
  skip_before_action :perform_user_authorization!, only: [ :create, :login ]

  def create
    @user = User.new(name: user_params[:name],
                      email: user_params[:email]&.downcase,
                      password: user_params[:password].to_s,
                      password_confirmation: user_params[:password].to_s,
                      mobile_number: user_params[:mobile_number]
                    )

    if @user.save
      render :show, status: :created
    else
      render json: { status: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_login_params[:email]&.downcase)

    if @user&.authenticate(user_login_params[:password])
      @token = JsonWebToken.encode(user_id: @user.id)
      render :login, status: :ok
    else
      render json: { status: false, errors: [ "Invalid email or password" ] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :name, :mobile_number)
  end

  def user_login_params
    params.permit(:email, :password)
  end
end
