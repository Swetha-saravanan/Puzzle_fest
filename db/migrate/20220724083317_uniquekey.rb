# frozen_string_literal: true

class Uniquekey < ActiveRecord::Migration[6.1]
  def change
    change_table :puzzles do |t|
      t.change :question, :string, index: { unique: true }
    end
  end
end
