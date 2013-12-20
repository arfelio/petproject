#  -*- encoding: utf-8 -*-
class ProjectsController < ApplicationController
  skip_before_filter :authorize, only:[:show,:index]
  # GET /projects
  # GET /projects.json
 
  def index
    @projects = Project.paginate(page: params[:page], order: 'created_at desc', per_page: 3)
  if  @projects.blank?
   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
   else
      render 'index1.html.erb'
   end 
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    begin
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Попытка доступа к несуществующей  #{params[:id]}"
      render file: "/home/ria081/petproject/pet/public/404.html"
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
   end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def delete_asset
    ad = Project.find(params[:project_id]) 
    asset = ad.pictures.find(params[:id])
    asset.asset.clear
    asset.destroy
    ad.save
    redirect_to :back
   end
  def sort_project
    @projects = Project.where("project_type = ?",params[:project][:project_type]).paginate(page: params[:page], order: 'created_at desc', per_page: 2)   
    #@projects = @projects.paginate page: params[:page], order: 'created_at desc',
   #per_page: 10
    respond_to do |format|
      format.html # home.html.erb
      format.json {render json: @projects}
    end
   
  end









end
