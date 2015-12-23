class PagesController < ApplicationController
  before_action :assign_page, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def display
    if params[:id]
      @page = Page.find_by(identifier: params[:id])
    else
      @page = Page.homepage.first
    end

    @title = @page.title
    set_state_for_page
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    flash[:notice] = 'Page was successfully created.' if @page.save
    redirect_to pages_path
  end

  def update
    flash[:notice] = 'Page was successfully updated.' if @page.update(page_params)
  end

  def destroy
    @page.destroy
  end

  private

  def assign_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :type)
  end

  def set_state_for_page
    case @page.type
    when "news" then set_state_for_news
    when "photos" then set_state_for_photos
    when "sermons" then set_state_for_sermons
    end
  end

  def set_state_for_news
    if params[:date] and params[:date] =~ /(\d{4})(\d\d)(\d\d)/
      @date = Time.local $1.to_i, $2.to_i, $3.to_i
      @news_items, @news_title = week_items_from @date
    else
      @date = Time.now.midnight
      @news_items = news_items_from_week @date
      @news_title = "This Week"
    end
  end

  def set_state_for_photos
    galleries = Photo.all.distinct(:gallery).sort
    @photos = []
    galleries.each do |gallery|
      @photos << [gallery, Photo.where(gallery: gallery).limit(4)]
    end
  end

  def set_state_for_sermons
    @sermons = Sermon.paginate page: params[:page], per_page: 10
  end
end
