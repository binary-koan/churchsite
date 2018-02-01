class PhotosController < ApplicationController
  include PhotosHelper
  before_action :authenticate_user!, except: :gallery

  def gallery
    @photos = Photo.where(gallery: params[:gallery]).asc(:order)
    @title = params[:gallery]

    render_404 unless @photos.any?
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
      Photo.where(gallery: @photo.gallery).destroy
    else
      @photo.destroy
    end

    if Photo.where(gallery: @photo.gallery).size > 0
      redirect_to gallery_photos_path(gallery: @photo.gallery)
    else
      redirect_to Page.photos.url_path
    end
  end

  def reorder
    params[:data].each do |id, order|
      photo = Photo.find(id)
      photo.order = order
      photo.save
    end

    render json: { updated: params[:data].size }
  end

  def rename_gallery
    Photo.where(gallery: params[:old_name]).update_all(gallery: params[:new_name])

    redirect_to gallery_photos_path(gallery: params[:new_name])
  end

  def delete_gallery
    Photo.where(gallery: params[:gallery]).destroy

    redirect_to Page.photos.url_path
  end

  private

  def photo_params
    params.require(:photo).permit(:gallery, :caption, :date, :order, :image)
  end
end
