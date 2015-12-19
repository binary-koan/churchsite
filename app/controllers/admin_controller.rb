class AdminController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!

  def dashboard
    @news_item = NewsItem.new

    @news_items = news_items_from_week Time.now
    @news_title = "This Week"
    @date = Time.now

    @sermons = Sermon.paginate page: params[:page], per_page: 10
  end

  def options
  end

  def about
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
