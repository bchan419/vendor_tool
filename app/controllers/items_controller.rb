class ItemsController < ApplicationController

  before_filter :require_project_owner_or_admin, :only => [:edit, :destroy] 
   
  def require_project_owner_or_admin
    employee = Employee.find_by_id(session[:user_id])
    project = Project.find_by_id(params[:project_id])
    project_owner_id = project.employee_id
    if employee.system_admin == FALSE && (employee.nil? || employee.id != project_owner_id)
      redirect_to project_url(project.id), notice: "Only Project Owner can edit and delete project items"
    end
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @project = Project.find_by_id(params[:project_id])
    @item = Item.new

    respond_to do |format|
      if @project.nil?
        redirect_to root_url, notice: 'Project not found.'
        return
      else
        format.html # new.html.erb
      end
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:item_id])
    @project = Project.find_by_id(params[:project_id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @project = Project.find_by_id(@item.project.id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @project, notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @project = Project.find_by_id(@item.project_id)

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @project, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:item_id])
    @project = Project.find_by_id(@item.project_id)

    @item.destroy

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
