class PrivatePhotoCollectionsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :authenticate_collection, only: :show

  def index
    @collections = PrivatePhotoCollection.order(name: :asc)
  end

  def show
  end

  def new
    @collection = PrivatePhotoCollection.new
  end

  def edit
    @collection = PrivatePhotoCollection.find(params[:id])
  end

  def create
    @collection = PrivatePhotoCollection.new(private_photo_collection_params)

    if @collection.save
      redirect_to @collection, notice: 'Private photo collection was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @collection = PrivatePhotoCollection.find(params[:id])

    if @collection.update_attributes(private_photo_collection_params)
      redirect_to @collection, notice: 'Private photo collection was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @collection = PrivatePhotoCollection.find(params[:id])
    @collection.destroy

    redirect_to private_photo_collections_path
  end

  def upload
    @collection = PrivatePhotoCollection.find(params[:id])

    params[:photos].each do |image|
      @collection.private_photos.create!(image: image)
    end

    redirect_to @collection
  end

  def remove
    @collection = PrivatePhotoCollection.find(params[:id])
    @collection.private_photos.find(params[:photo_id]).destroy!

    redirect_to @collection
  end

  private

  def authenticate_collection
    @collection = PrivatePhotoCollection.find(params[:id])

    return if current_user.present?

    authenticate_or_request_with_http_basic('Photo Collection') do |username, password|
      username == @collection.username && @collection.authenticate(password)
    end
  end

  def private_photo_collection_params
    params.require(:private_photo_collection).permit(:name, :username, :password)
  end
end
