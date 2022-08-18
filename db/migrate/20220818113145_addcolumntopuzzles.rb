# frozen_string_literal: true

class Addcolumntopuzzles < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles, :time, :time
  end
end
