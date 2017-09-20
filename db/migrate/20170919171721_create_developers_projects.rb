class CreateDevelopersProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :developers_projects, id: false  do |t|
      t.belongs_to :developer, index: true
      t.belongs_to :project, index: true
    end
  end
end
