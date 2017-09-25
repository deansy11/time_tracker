class AddProjectIdToTimeEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :time_entries, :project_id, :integer
  end
end
