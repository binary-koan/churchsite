class NewsItemsController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!

  def create
    @news_item = NewsItem.new(news_item_params)

    if @news_item.save
      redirect_to request.referer, notice: "News item was successfully created."
    else
      redirect_to request.referer, alert: "News item could not be created."
    end
  end

  def update
    @news_item = NewsItem.find(params[:id])

    if @news_item.update_attributes(news_item_params)
      redirect_to request.referer, notice: "News item was successfully updated."
    else
      redirect_to request.referer, alert: "News item could not be updated."
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    redirect_to request.referer
  end

  def events
    month = params[:month].to_i
    year = params[:year].to_i
    day = params[:day].to_i

    render json: {
      days: days_with_events(year, month),
      content: news_container_content(year, month, day)
    }
  end

  private

  def news_item_params
    params.require(:news_item).permit(:title, :content, :owner, :picked_date, :picked_time, :repeat_type, :repeat_until)
  end

  def news_container_content(year, month, day)
    @news_week = NewsWeek.new(Time.local(year, month, day))

    render_to_string("events")
  end

  def days_with_events(year, month)
    month_start = Time.local(year, month, 1)
    month_end = month_start + 1.month - 1.day

    news_items = NewsItem.and({ :date.gte => month_start}, { :date.lt => month_end }).sort(date: 1)
    days = Set.new(news_items.map { |item| item.date.localtime.mday })
    days.to_a
  end
end
