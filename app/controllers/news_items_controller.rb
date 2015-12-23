class NewsItemsController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!

  def new
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def create
    @news_item = NewsItem.new(news_item_params)

    respond_to do |format|
      if @news_item.save
        format.html { redirect_to request.referer, notice: 'News item was successfully created.' }
        format.json { render json: @news_item, status: :created, location: @news_item }
      else
        format.html { render action: "new" }
        format.json { render json: @news_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @news_item = NewsItem.find(params[:id])

    respond_to do |format|
      if @news_item.update_attributes(news_item_params)
        format.html { redirect_to request.referer, notice: 'News item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    respond_to do |format|
      format.html { redirect_to news_items_url }
      format.json { head :no_content }
    end
  end

  private

  def news_item_params
    params.require(:news_item).permit(:title, :content, :owner, :picked_date, :picked_time)
  end
end
