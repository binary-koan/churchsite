class AdminController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!

  def redirect
    # Utility so that going to /admin redirects to either sign in or
    # the homepage depending on whether you're logged in
    redirect_to root_path
  end

  def toggle_editing
    session[:editing] = !session[:editing]

    redirect_to params[:return_to]
  end

  def users
  end

  def confirm_user
    if User.find_by(email: params[:email]).confirm
      redirect_to action: 'users', notice: "User has been confirmed."
    else
      redirect_to action: 'users', error: "Couldn't confirm that user. Maybe they're already confirmed?"
    end
  end

  def deny_user
    User.delete_all email: params[:email]
    redirect_to action: 'users'
  end
end
