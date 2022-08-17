class Addcolumninplayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :random_no, :bigint
  end
end
