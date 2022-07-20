class CreatePuzzles < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzles do |t|
      t.string :question, null: false
      t.string :option1, null: false
      t.string :option2, null: false
      t.string :option3, null: false
      t.string :option4, null: false

      t.timestamps
    end
  end
end
