class ApplicationController < ActionController::Base
  include Knock::Authenticable

  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :configure_permitted_parameters, if: :user_controller?

  protected

  def set_current_user
    if current_user
       Current.user = current_user
    end
  end

  def require_user_logged_in!
    redirect_to new_user_session_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:user, keys: [:first_name, :last_name, :email, :password, :password_confirmation])

  end

end
