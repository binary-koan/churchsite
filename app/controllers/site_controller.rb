class SiteController < ApplicationController
  include NewsItemsHelper

  def community
    @page = CommunityPage.where(identifier: params[:id]).first
    @title = @page.title
  end
end
