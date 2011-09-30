class DeliveriesController < ApplicationController
  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliveries }
    end
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery }
    end
  end

  # GET /deliveries/new
  # GET /deliveries/new.json
  def new
    @project= Project.find(params[:project_id]) if params[:project_id]
    @delivery = @project ? @project.deliveries.build : Delivery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery }
    end
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @version = Version.find(params[:version_id])
    @delivery = Delivery.new(params[:delivery])
    @delivery.version = @version
    respond_to do |format|
      if @delivery.save
        format.html { redirect_to project_version_path(@version.project.id, @version.id) , notice: 'Delivery was successfully created.' }
        format.json { render json: @delivery, status: :created, location: @delivery }
      else
        format.html { redirect_to project_version_path(@version.project.id, @version.id) }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deliveries/1
  # PUT /deliveries/1.json
  def update
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      if @delivery.update_attributes(params[:delivery])
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def transition
    @project = Project.find(params[:project_id])
    @del = Delivery.find(params[:id])
    
    @del.fire_events(params[:event].to_sym)
    respond_to do |format|
      format.html {redirect_to project_version_path(@del.version.project.id, @del.version.id)}
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy

    respond_to do |format|
      format.html { redirect_to @delivery.project ? @delivery.project : deliveries_url }
      format.json { head :ok }
    end
  end
end
