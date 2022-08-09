class AddColumnTopuzzles < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles ,:correct_answer, :string
  end
end
