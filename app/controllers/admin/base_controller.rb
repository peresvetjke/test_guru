class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def authenticate_admin!
    unless current_user.type == 'Admin'
      sign_out(current_user)
      redirect_to new_user_session_path, alert: 'Для доступа к странице авторизуйтесь под учетной записью Администратора' 
    end
  end
end