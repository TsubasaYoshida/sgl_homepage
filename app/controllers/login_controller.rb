class LoginController < ApplicationController
  layout false
  skip_before_action :check_logined

  def index
  end

  def auth
    usr = User.find_by(username: params[:username])

    if usr && usr.authenticate(params[:password]) then

      reset_session
      session[:usr] = usr.id
      redirect_to '/admin/top'
    else
      @error = '入力値が間違っています。'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect_to '/login', notice: 'ログアウトしました。'
  end
end
