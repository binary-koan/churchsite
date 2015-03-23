class OptionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /options
  # GET /options.json
  def index
    @options = Option.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @options }
    end
  end

  # GET /options/1
  # GET /options/1.json
  def show
    @option = Option.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @option }
    end
  end

  # GET /options/new
  # GET /options/new.json
  def new
    @option = Option.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @option }
    end
  end

  # GET /options/1/edit
  def edit
    @option = Option.find(params[:id])
  end

  # POST /options
  # POST /options.json
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to request.referer, notice: 'Option was successfully created.' }
        format.json { render json: @option, status: :created, location: @option }
      else
        format.html { render action: "new" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /options/1
  # PUT /options/1.json
  def update
    @option = Option.find(params[:id])

    respond_to do |format|
      if @option.update_attributes(option_params)
        $config = Option.first

        format.html { redirect_to request.referer, notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option = Option.find(params[:id])
    @option.destroy

    respond_to do |format|
      format.html { redirect_to options_url }
      format.json { head :no_content }
    end
  end

  private
    def option_params
      params.require(:option).permit(
        :use_news, :use_community, :use_about, :use_photos, :use_sermons,
        :news_name, :community_name, :about_name, :photos_name, :sermons_name,
        :news_announcement, :title, :church_type, :tagline, :about_page,
        :leader_title, :leader_name, :leader_phone,
        :leader_use_email, :leader_use_phone, :leader_use_address,
        :leader_email, :leader_address, :leader_image
      )
    end
end
