class AddProjectIdToDevelopers < ActiveRecord::Migration[5.1]
  def change
    add_column :developers, :project_id, :integer
  end
end
