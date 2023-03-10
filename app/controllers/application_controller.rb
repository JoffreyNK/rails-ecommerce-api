class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: 'unauthorized user, please register or contact your admin' }, status: :unauthorized
    end
  end
end
