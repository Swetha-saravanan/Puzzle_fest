# frozen_string_literal: true

class CreatePuzzles < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzles do |t|
      t.string :question, null: false
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :answer

      t.timestamps
    end
  end
end
