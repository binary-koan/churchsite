class SermonsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @sermon = Sermon.find(params[:id])
  end

  def new
    @sermon = Sermon.new
  end

  def edit
    @sermon = Sermon.find(params[:id])
  end

  def create
    @sermon = Sermon.new(sermon_params)

    if @sermon.save
      redirect_to @sermon, notice: 'Sermon was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @sermon = Sermon.find(params[:id])

    if @sermon.update_attributes(sermon_params)
      redirect_to @sermon, notice: 'Sermon was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @sermon = Sermon.find(params[:id])
    @sermon.destroy

    redirect_to Page.sermons.url_path
  end

  private

  def sermon_params
    params.require(:sermon).permit(:title, :description, :content, :podcast_ogg, :podcast_mp3, :picked_date)
  end
end
