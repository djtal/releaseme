class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @channel = Channel.find(params[:channel_id])
    @application = @channel.applications.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @channel = Channel.find(params[:channel_id])
    @application = Application.new(params[:application])
    @application.channel = @channel

    respond_to do |format|
      if @application.save
        format.html { redirect_to @channel, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def move_up
    @channel = Channel.find(params[:channel_id])
    @app = @channel.applications.find(params[:id])
    
    @app.move_higher
    respond_to do |format|
      format.html{redirect_to @channel}
    end
  end
  
  def move_down
    @channel = Channel.find(params[:channel_id])
    @app = @channel.applications.find(params[:id])
    
    @app.move_lower
    respond_to do |formate|
      format.html{redirect_to @channel}
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :ok }
    end
  end
end
