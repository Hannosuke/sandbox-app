class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to login_path, notice: "ログインしてください。"
    end
  end
end
