class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to @project
      else
        render 'new'
      end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_path }
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :description, developers_attributes: [:id, :name, :email], time_entries_attributes: [:entry])
  end

end
