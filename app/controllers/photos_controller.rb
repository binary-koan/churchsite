class PhotosController < ApplicationController
  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    galleries = Photo.all.distinct(:gallery).sort
    @photos = []
    galleries.each do |gallery|
      @photos << [gallery, Photo.where(gallery: gallery).first]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: galleries }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photos = Photo.where(gallery_id: params[:id]).sort date: -1
    if @photos.length == 0
      redirect_to photos_path
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @photos }
      end
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    if params[:gallery_id] and params[:gallery]
      @photo.gallery_id = params[:gallery_id]
      @photo.gallery = params[:gallery]
    end

    respond_to do |format|
      if @photo.save
        format.html { redirect_to "/admin/photos/#{params[:gallery_id]}" }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to "/admin/photos/#{params[:gallery]}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find params[:id]
    if params[:gallery]
      @photos = Photo.where gallery_id: @photo.gallery_id
      @photos.destroy
    else
      @photo.destroy
    end

    respond_to do |format|
      format.html { redirect_to "/admin/photos/#{params[:gallery_id]}" }
      format.json { head :no_content }
    end
  end
end
