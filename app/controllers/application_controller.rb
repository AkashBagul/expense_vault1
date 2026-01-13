class ApplicationController < ActionController::API
  before_action :authenticate_user!

  attr_reader :current_user

  private

    def authenticate_user!
      token = extract_token
      payload = JsonWebToken.decode(token)

      return render_unauthorized unless payload

      @current_user = User.find_by(id: payload[:user_id])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render_unauthorized
    end

    def extract_token
      header = request.headers["Authorization"]
      header&.split(" ")&.last
    end

    def render_unauthorized
      render json: {
        status: false,
        error: "User not authorized"
      }, status: :unauthorized
    end
end
