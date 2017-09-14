class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.fin(params[:id])
  end

private

  def project_params
    params.require(:project).permit(:name, :description, developers_attributes: [:id, :name, :email], time_entries_attributes: [:entry])
  end

end
