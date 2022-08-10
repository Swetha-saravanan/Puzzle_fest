# frozen_string_literal: true

class DropForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :assessments, :users
  end
end
