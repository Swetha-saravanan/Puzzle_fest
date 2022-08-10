# frozen_string_literal: true

class AddForeignKeyQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :assessments, index: true
  end
end
