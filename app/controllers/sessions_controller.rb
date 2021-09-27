class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.notice = "Вы успешно авторизованы! Время приступить к тестам!"
      #redirect_to cookies[:request_path].present? cookies[:request_path] : @user
      if cookies[:request_path].present?
        redirect_to cookies[:request_path] 
      else
        redirect_to @user
      end
    else
      redirect_to login_path, notice: "Не корректные данные авторизации!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end