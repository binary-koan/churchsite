class BulletinsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bulletin = Bulletin.new(bulletin_params)

    if @bulletin.save
      redirect_to request.referer, notice: "Bulletin was successfully created."
    else
      redirect_to request.referer, alert: "Bulletin could not be created."
    end
  end

  def edit
    @bulletin = Bulletin.find(params[:id])
  end

  def update
    @bulletin = Bulletin.find(params[:id])

    if @bulletin.update_attributes(bulletin_params)
      redirect_to Page.bulletins.url_path, notice: "Bulletin was successfully updated."
    else
      redirect_to request.referer, alert: "Bulletin could not be updated."
    end
  end

  def destroy
    @bulletin = Bulletin.find(params[:id])
    @bulletin.destroy

    redirect_to request.referer
  end

  private

  def bulletin_params
    params.require(:bulletin).permit(:date, :document)
  end
end
