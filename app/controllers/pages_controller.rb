class PagesController < ApplicationController
  def home
  end

  def news
    today = Date.today
    this_week_start = today - today.cwday
    if params[:date]
      @start_date = Date.parse(params[:date])
      end_date = @start_date + 7.days
      @this_week = @start_date == this_week_start
    else
      @start_date = this_week_start
      end_date = today
      @this_week = true
    end

    @news_items = NewsItem.and({ :date.gte => @start_date}, { :date.lte => end_date })
  end
  
  def community
    @page = CommunityPage.where(identifier: params[:id]).first
  end

  def sermons
    @sermons = Sermon.paginate page: params[:page], per_page: 10
  end

  def about
  end
end
