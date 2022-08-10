# frozen_string_literal: true

class AddCorrectAnswerReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :correct_answer, :string
  end
end
