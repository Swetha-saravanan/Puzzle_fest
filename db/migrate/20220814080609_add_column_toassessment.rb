# frozen_string_literal: true

class AddColumnToassessment < ActiveRecord::Migration[6.1]
  def change
    add_column :assessments, :category, :string
    add_column :assessments, :description, :string
    add_column :assessments, :images, :binary
  end
end
