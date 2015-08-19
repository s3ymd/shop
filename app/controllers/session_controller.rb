class SessionController < ApplicationController
  def new
  end

  def create
    email = params[:login][:email]
    password = params[:login][:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      sign_in user
      redirect_to :root, notice: 'ログインしました'
    else
      redirect_to :login, alert: 'ユーザー名またはパスワードが異なります'
    end
  end

  def destroy
    sign_out
    redirect_to :root, notice: 'ログアウトしました'
  end
end
