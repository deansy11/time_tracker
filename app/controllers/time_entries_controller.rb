class TimeEntriesController < ApplicationController
  def index
    @developer = current_developer
    @current_developer = @developer.id
    @time_entries = @developer.time_entries
  end

  def new
    @time_entry = TimeEntry.new
    @developer = current_developer
  end

  def show
    @time_entry = TimeEntry.find(params[:id])
    @developer = current_developer
  end

  def create
    @developer = Developer.find(params[:developer_id])
    @time_entry = @developer.time_entries.build(time_entry_params)
      if @time_entry.save
        redirect_to developer_time_entry_path(@developer, @time_entry)
      else
        render 'new'
      end
  end

  def destroy
    @time_entry = TimeEntry.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to time_entries_path }
    end
  end

  private

    def time_entry_params
      params.require(:time_entry).permit(:entry, :date_field, :developer_id, projects_attributes: [:name, :description], developers_attributes: [:id, :name, :email], developers_projects_attributes: [:developer_id])
  end

end
