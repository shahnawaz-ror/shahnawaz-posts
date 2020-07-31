class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name country state city gender avtar phone])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name country state city gender avtar phone])
  end
end
