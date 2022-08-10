# frozen_string_literal: true

class AddUniquetoColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.bigint :phone_no, null: false, index: { unique: true }
      t.string :password_digest, null: false, index: { unique: true }
    end
  end
end
