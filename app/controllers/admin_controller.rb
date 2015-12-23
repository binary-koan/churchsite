class AdminController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!

  def toggle_editing
    session[:editing] = !session[:editing]

    redirect_to params[:return_to]
  end

  def users
  end

  def confirm_user
    puts "Email:"
    puts params[:email]
    User.where(email: params[:email]).each do |user|
      puts "Confirming ..."
      user.confirm!
    end
    redirect_to action: 'users'
  end

  def deny_user
    User.delete_all email: params[:email]
    redirect_to action: 'users'
  end
end
