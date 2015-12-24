class SiteController < ApplicationController
  include NewsItemsHelper

  def events_in
    month = params[:month].to_i
    year = params[:year].to_i

    start_date = Time.new(year, month, 1)
    end_date = start_date + 1.month - 1.day

    news_items = NewsItem.and({ :date.gte => start_date}, { :date.lt => end_date }).sort(date: 1)
    days = Set.new(news_items.map { |item| item.date.localtime.mday })

    render json: { days: days.to_a }
  end

  def community
    @page = CommunityPage.where(identifier: params[:id]).first
    @title = @page.title
  end
end
