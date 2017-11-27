class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allow 'name' parameter in Devise registration (the lazy way)
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :assign_pages

  rescue_from Mongoid::Errors::DocumentNotFound, with: :render_404

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
  end

  def assign_pages
    @top_level_pages = Page.where(parent: nil).asc(:order)
  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end
end
