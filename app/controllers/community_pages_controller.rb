class CommunityPagesController < ApplicationController
  before_filter :authenticate_user!

  # GET /community_pages
  # GET /community_pages.json
  def index
    @community_pages = CommunityPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @community_pages }
    end
  end

  # GET /community_pages/1
  # GET /community_pages/1.json
  def show
    @community_page = CommunityPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @community_page }
    end
  end

  # GET /community_pages/new
  # GET /community_pages/new.json
  def new
    @community_page = CommunityPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @community_page }
    end
  end

  # GET /community_pages/1/edit
  def edit
    @community_page = CommunityPage.find(params[:id])
  end

  # POST /community_pages
  # POST /community_pages.json
  def create
    @community_page = CommunityPage.new(params[:community_page])

    respond_to do |format|
      if @community_page.save
        format.html { redirect_to community_pages_url, notice: 'Community page was successfully created.' }
        format.json { render json: @community_page, status: :created, location: @community_page }
      else
        format.html { render action: "new" }
        format.json { render json: @community_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /community_pages/1
  # PUT /community_pages/1.json
  def update
    @community_page = CommunityPage.find(params[:id])

    respond_to do |format|
      if @community_page.update_attributes(params[:community_page])
        format.html { redirect_to community_pages_url, notice: 'Community page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @community_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_pages/1
  # DELETE /community_pages/1.json
  def destroy
    @community_page = CommunityPage.find(params[:id])
    @community_page.destroy

    respond_to do |format|
      format.html { redirect_to community_pages_url }
      format.json { head :no_content }
    end
  end
end
