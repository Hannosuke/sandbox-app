class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました。"
    else
      flash[:notice] = "メールアドレスかパスワードが間違っています。"
      render :new, status: :forbidden
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました。"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
