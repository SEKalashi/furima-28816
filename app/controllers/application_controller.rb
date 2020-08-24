class ApplicationController < ActionController::Base
  before_action :authenicate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :first_kana, :family_name, :family_kana, :birthday])
  end
end