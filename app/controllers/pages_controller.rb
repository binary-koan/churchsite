class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @pages = Page.all
    respond_with(@pages)
  end

  def show
    respond_with(@page)
  end

  def new
    @page = Page.new
    respond_with(@page)
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    flash[:notice] = 'Page was successfully created.' if @page.save
    respond_with(@page)
  end

  def update
    flash[:notice] = 'Page was successfully updated.' if @page.update(page_params)
    respond_with(@page)
  end

  def destroy
    @page.destroy
    respond_with(@page)
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :content)
    end
end
