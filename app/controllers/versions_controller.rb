class VersionsController < ApplicationController
  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @versions }
    end
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
    @project = Project.find(params[:project_id])
    @version = @project.versions.where(:id => params[:id]).first
    @applications = @version.channel.applications.joins(:environment)
    @deliveries = @version.deliveries.group_by(&:application)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @version }
    end
  end

  # GET /versions/new
  # GET /versions/new.json
  def new
    @project = Project.find(params[:project_id])
    @version = @project.versions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @version }
    end
  end

  # GET /versions/1/edit
  def edit
    @version = Version.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  # POST /versions
  # POST /versions.json
  def create
    @project = Project.find(params[:project_id])
    @version = Version.new(params[:version])
    @version.project = @project

    respond_to do |format|
      if @version.save
        format.html { redirect_to [@project,@version], notice: 'Version was successfully created.' }
        format.json { render json: @version, status: :created, location: @version }
      else
        format.html { render action: "new" }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /versions/1
  # PUT /versions/1.json
  def update
    @project = Project.find(params[:project_id])
    @version = Version.find(params[:id])

    respond_to do |format|
      if @version.update_attributes(params[:version])
        format.html { redirect_to [@project,@version], notice: 'Version was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @version = Version.find(params[:id])
    @version.destroy

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :ok }
    end
  end
end
