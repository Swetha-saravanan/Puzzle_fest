class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :correct_answer, :string
  end
end
