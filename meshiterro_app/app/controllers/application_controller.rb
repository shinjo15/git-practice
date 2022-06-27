class ApplicationController < ActionController::Base
  before_action :configure_permtted_parmeitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permtted_parmeitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
