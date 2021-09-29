class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
=begin
  helper_method :logged_in?, :current_user

  def authentication_user!
    unless logged_in?
      cookies[:request_path] = request.path
      redirect_to login_path 
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
=end

end