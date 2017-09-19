class TimeEntriesController < ApplicationController
  def index
    @time_entries = Time_entry.all
  end

  def new
    @time_entry = Time_entry.new
  end

  def show
    @time_entry = Time_entry.find(params[:id])
  end

  def create
    @time_entry = Time_entry.new(time_entry_params)
      if @time_entry.save
        redirect_to @time_entry
      else
        render 'new'
      end
  end

  def destroy
    @time_entry = Time_entry.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to time_entries_path }
    end
  end

  private

    def time_entry_params
      params.require(:time_entry).permit(:entry, projects_attributes: [:name, :description], developers_attributes: [:name, :id, :email])
  end

end
