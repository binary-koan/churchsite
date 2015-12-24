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

  def events_in_month
    month = params[:month].to_i
    year = params[:year].to_i

    start_date = Time.new(year, month, 1)
    end_date = start_date + 1.month - 1.day

    news_items = NewsItem.and({ :date.gte => start_date}, { :date.lt => end_date }).sort(date: 1)
    days = Set.new(news_items.map { |item| item.date.localtime.mday })

    render json: { days: days.to_a }
  end

  private

  def news_item_params
    params.require(:news_item).permit(:title, :content, :owner, :picked_date, :picked_time)
  end
end
