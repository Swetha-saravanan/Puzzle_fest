# frozen_string_literal: true

class AddColumnToPuzzles < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles, :kind_of_question, :string
  end
end
