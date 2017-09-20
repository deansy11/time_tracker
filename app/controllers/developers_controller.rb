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
        redirect_to @developer
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
      params.require(:developer).permit(:name, :email, :password_digest, projects_attributes: [:name, :description], time_entries_attributes: [:entry])
  end

end
