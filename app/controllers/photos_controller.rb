class PhotosController < ApplicationController
  include PhotosHelper
  before_action :authenticate_user!

  def gallery
    @photos = Photo.where(gallery: params[:gallery]).asc(:order)
    #TODO throw Not Found unless @photos.size > 0
    @title = params[:gallery]
  end

  def new
    @photo = Photo.new

    @photo.gallery = params[:gallery] if params[:gallery]
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if params[:gallery_id] and params[:gallery]
      @photo.gallery_id = params[:gallery_id]
      @photo.gallery = params[:gallery]
    end

    if @photo.save
      redirect_to gallery_photos_path(gallery: @photo.gallery)
    else
      render action: "new"
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to gallery_photos_path(gallery: @photo.gallery)
    else
      render action: "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    if params[:gallery]
      @photos = Photo.where(gallery_id: @photo.gallery_id)
      @photos.destroy
    else
      @photo.destroy
    end

    if Photo.where(gallery_id: @photo.gallery_id).size > 0
      redirect_to gallery_photos_path(gallery: @photo.gallery)
    else
      redirect_to Page.photos.url_path
    end
  end

  def reorder
    if request.post?
      params[:data].each do |id, order|
        @photo = Photo.find(id)
        @photo.order = order
        @photo.save
      end

      redirect_to gallery_photos_path(gallery: @photo.gallery)
    else
      @photos = Photo.where(gallery_id: params[:id]).asc :order
      @gallery = @photos.first.gallery
      @gallery_id = params[:id]
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:gallery, :gallery_id, :caption, :date, :order, :image)
  end
end
