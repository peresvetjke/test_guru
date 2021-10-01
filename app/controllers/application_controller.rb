class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : tests_path
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = (params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)) ? params[:locale] : I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end