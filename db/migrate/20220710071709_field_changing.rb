# frozen_string_literal: true

class FieldChanging < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.index %i[email phone_no password_digest], unique: true
    end
  end
end
