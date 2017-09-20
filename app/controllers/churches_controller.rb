class ChurchesController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_church, only: [:edit, :update, :destroy]

  def new
    @church = Church.new
  end

  def edit
  end

  def create
    @church = Church.new(church_params)

    if @church.save
      redirect_to Page.homepage.url_path, notice: "Church was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @church.update_attributes(church_params)
      redirect_to Page.homepage.url_path, notice: "Church was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @church.destroy

    redirect_to Page.homepage.url_path, notice: "Church was destroyed."
  end

  private

  def church_params
    params.require(:church).permit(
      :image, :name, :services_description, :address, :map_address
    )
  end

  def assign_church
    @church = Church.find(params[:id])
  end
end
