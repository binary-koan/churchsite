class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
  	flash[:notice] = 'Your account settings have successfully been updated.'
    edit_user_registration_path
  end
end
