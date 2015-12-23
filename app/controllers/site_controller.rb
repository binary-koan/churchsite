class SiteController < ApplicationController
  include NewsItemsHelper

  def homepage
  end

  def page
    @page = Page.find(params[:id])
    @title = page.title
  end

  def news
    if params[:date] and params[:date] =~ /(\d{4})(\d\d)(\d\d)/
      @date = Time.local $1.to_i, $2.to_i, $3.to_i
      @news_items, @news_title = week_items_from @date
    else
      @date = Time.now.midnight
      @news_items = news_items_from_week @date
      @news_title = "This Week"
    end

    @title = $config.news_name
  end

  def events_in
    month = params[:month].to_i
    year = params[:year].to_i

    start_date = Time.new year, month, 1
    end_date = Time.new year, month + 1, 1
    end_date -= 1.day

    news_items = NewsItem.and({ :date.gte => start_date}, { :date.lt => end_date }).sort date: 1
    days = Set.new
    news_items.each do |item|
      days << item.date.localtime.mday
    end

    respond_to do |format|
      format.json { render json: days.to_a }
    end
  end

  def community
    @page = CommunityPage.where(identifier: params[:id]).first
    @title = @page.title
  end

  def photos
    galleries = Photo.all.distinct(:gallery).sort
    @photos = []
    galleries.each do |gallery|
      @photos << [gallery, Photo.where(gallery: gallery).limit(4)]
    end
    @title = $config.photos_name
  end

  def gallery
    @photos = Photo.where(gallery_id: params[:id]).asc :order
    @title = $config.photos_name
  end

  def sermons
    @sermons = Sermon.paginate page: params[:page], per_page: 10
    @title = $config.sermons_name
  end

  def sermon
    @sermon = Sermon.find params[:id]
  end

  def about
    @title = $config.about_name
  end
end
