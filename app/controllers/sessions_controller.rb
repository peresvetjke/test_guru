class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      username = @user.login.present? ? @user.login : @user.email
      flash.notice = "Добро пожаловать, #{username} ! Время приступить к тестам!"

      redirect_to cookies[:request_path] || root_path
    else
      redirect_to login_path, notice: "Не корректные данные авторизации!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end