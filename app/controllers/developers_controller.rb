class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      session[:developer_id] = @developer.id
      redirect_to developers_path @developer
      else
        render 'new'
      end
  end

  def destroy
    @developer = Developer.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to developers_path }
    end
  end

  private

    def developer_params
      params.require(:developer).permit(:name, :email, :id, :password_digest, :password_confirmation, projects_attributes: [:name, :description], time_entries_attributes: [:entry, :date_field], developers_projects_attributes: [:developer_id])
  end

end
