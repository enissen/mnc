class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  private

  # Devise path helper
  def after_sign_in_path_for(resource)
    #current_user_path
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
