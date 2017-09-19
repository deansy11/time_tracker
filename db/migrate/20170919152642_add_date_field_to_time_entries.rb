class AddDateFieldToTimeEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :time_entries, :date_field, :date
  end
end
