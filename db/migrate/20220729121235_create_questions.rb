# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :kind_of_question
      t.references :puzzles, index: true, foreign_key: true
      t.timestamps
    end
  end
end
