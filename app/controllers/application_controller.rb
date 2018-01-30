class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def alert message
    render js: "alert(#{message.inspect})"
  end

  def self.require_login
    before_action do
      redirect_to new_session_path unless current_user
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_locale
    if current_user
      I18n.locale = current_user.language_sym
    else
      I18n.locale = I18n.default_locale
    end
  end
end
