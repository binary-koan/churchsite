class AdminController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @news_item = NewsItem.new

    today = Date.today
    last_sunday = today - today.cwday
    @news_items = NewsItem.where(:date.gte => last_sunday).sort date: -1
    @this_week = true

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
