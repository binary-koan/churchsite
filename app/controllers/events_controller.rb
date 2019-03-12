class NewsItemsController < ApplicationController
  include NewsItemsHelper

  before_action :authenticate_user!, except: :events

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to request.referer, notice: "Event was successfully created."
    else
      redirect_to request.referer, alert: "Event could not be created."
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to request.referer, notice: "Event was successfully updated."
    else
      redirect_to request.referer, alert: "Event could not be updated."
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to request.referer
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :date_description, :show_until, :special, :image)
  end
end
