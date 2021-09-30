class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    user.type == 'Admin' ? admin_tests_path : tests_path
  end
end