class AddDeveloperIdToTimeEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :time_entries, :developer_id, :integer
  end
end
