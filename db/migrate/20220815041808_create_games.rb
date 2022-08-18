# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.bigint :random_no
      t.references :assessments, foreign_key: true

      t.timestamps
    end
  end
end
