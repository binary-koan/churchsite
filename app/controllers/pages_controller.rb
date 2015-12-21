class PagesController < ApplicationController
  before_action :assign_page, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def display
    @page = Page.find_by(identifier: params[:id])
    respond_with(@page)
  end

  def index
    @pages = Page.all
    respond_with(@pages)
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
    redirect_to pages_path
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

  def assign_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :type)
  end

  def show_page_path
    case @page.type
    when "custom" then page_path(@page)
    when "homepage" then root_path
    else "/#{@page.type}"
    end
  end
end
