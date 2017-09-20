class TimeEntriesController < ApplicationController
  def index
    @time_entries = TimeEntry.all
  end

  def new
    @time_entry = TimeEntry.new
  end

  def show
    @time_entry = TimeEntry.find(params[:id])
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
      if @time_entry.save
        redirect_to @time_entry
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
      params.require(:time_entry).permit(:entry, projects_attributes: [:name, :description], developers_attributes: [:name, :id, :email])
  end

end
