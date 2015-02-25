class ApplicationController < ActionController::Base
  protect_from_forgery

  # Allow 'name' parameter in Devise registration (the lazy way)
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
