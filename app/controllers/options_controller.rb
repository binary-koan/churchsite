class OptionsController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if Option.instance.update_attributes(option_params)
      redirect_path = params[:return_to] || Page.homepage.url_path
      redirect_to redirect_path, notice: "Option was successfully updated."
    else
      render action: "edit"
    end
  end

  private

  def option_params
    params.require(:option).permit(
      :news_announcement, :title, :church_type, :tagline, :about_page,
      :leader_title, :leader_name, :leader_phone,
      :leader_use_email, :leader_use_phone, :leader_use_address,
      :leader_email, :leader_address, :leader_image
    )
  end
end
