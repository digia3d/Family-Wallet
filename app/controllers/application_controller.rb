class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_global_variables
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def set_global_variables
    @current_user = current_user
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :password_confirmation)
    end
  end
end
