class ChurchesController < ApplicationController
  before_filter :authenticate_user!

  # GET /churches
  # GET /churches.json
  def index
    @churches = Church.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @churches }
    end
  end

  # GET /churches/1
  # GET /churches/1.json
  def show
    @church = Church.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @church }
    end
  end

  # GET /churches/new
  # GET /churches/new.json
  def new
    @church = Church.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @church }
    end
  end

  # GET /churches/1/edit
  def edit
    @church = Church.find(params[:id])
  end

  # POST /churches
  # POST /churches.json
  def create
    @church = Church.new(church_params)

    respond_to do |format|
      if @church.save
        format.html { redirect_to action: 'index', notice: 'Church was successfully created.' }
        format.json { render json: @church, status: :created, location: @church }
      else
        format.html { render action: "new" }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /churches/1
  # PUT /churches/1.json
  def update
    @church = Church.find(params[:id])

    respond_to do |format|
      if @church.update_attributes(church_params)
        format.html { redirect_to action: 'index', notice: 'Church was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /churches/1
  # DELETE /churches/1.json
  def destroy
    @church = Church.find(params[:id])
    @church.destroy

    respond_to do |format|
      format.html { redirect_to churches_url }
      format.json { head :no_content }
    end
  end

  private
    def church_params
      params.require(:church).permit(:image, :name, :services_description, :address, :map_address)
    end
end
