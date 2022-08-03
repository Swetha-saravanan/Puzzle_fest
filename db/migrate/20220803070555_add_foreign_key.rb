class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :puzzles, :assessments, index: true
  end
end
