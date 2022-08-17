class AddforeignkeytoQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :puzzles, index: true

  end
end
