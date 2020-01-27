class ProjectsController < ApplicationController
	def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] ="Successfully created a project"
      redirect_to root_path
    else
      render 'new'
    end 
    #return render body: @charity.inspect
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])

  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] ="Successfully updated a project"
      redirect_to root_path
    else
      render 'edit'
    end 
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] ="Successfully destroyed a project"
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name,:charity_id)
  end
end
