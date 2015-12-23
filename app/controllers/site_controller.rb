class SiteController < ApplicationController
  include NewsItemsHelper

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

  def sermon
    @sermon = Sermon.find params[:id]
  end
end
