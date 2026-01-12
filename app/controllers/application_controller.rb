class ApplicationController < ActionController::API
  before_action :perform_user_authorization!

  def perform_user_authorization!
    header = request.headers["Authorization"]
    token = header&.split(" ")&.last
    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue
    render json: { status: false, error: "User not authorized to perform this action!" }, status: :unauthorized
  end
end
