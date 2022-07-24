class AddcolumntoQuiz < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles ,:button , :string
  end
end
