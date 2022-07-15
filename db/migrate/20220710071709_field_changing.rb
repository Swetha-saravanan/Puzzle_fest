class FieldChanging < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.index [:email, :phone_no,:password_digest], unique: true
    end
  end
end
