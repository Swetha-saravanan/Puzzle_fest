class AddColumnToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports ,:time_limit, :time
  end
end
