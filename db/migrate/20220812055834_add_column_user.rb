# frozen_string_literal: true

class AddColumnUser < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles, :images, :binary
  end
end
