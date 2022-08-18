# frozen_string_literal: true

class Changecolumnoftime < ActiveRecord::Migration[6.1]
  def change
    change_column :puzzles, :time, :integer
  end
end
