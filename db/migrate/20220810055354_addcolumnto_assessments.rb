# frozen_string_literal: true

class AddcolumntoAssessments < ActiveRecord::Migration[6.1]
  def change
    add_column :assessments, :random_no, :bigint
  end
end
