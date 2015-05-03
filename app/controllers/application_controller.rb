class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :detect_browser

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :second_name, :username, :email, :password,
                                                            :password_confirmation, :remember_me, :avatar, :avatar_cache, :remote_avatar_url) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :second_name, :username, :email, :password,
                                                                   :password_confirmation, :current_password, :avatar, :avatar_cache, :remote_avatar_url) }
  end

  private
  def detect_browser
    case request.user_agent
      when /iPad/i
        request.variant = :tablet
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Android/i
        request.variant = :tablet
      when /Windows Phone/i
        request.variant = :phone
      else
        request.variant = :desktop
    end
  end
end
