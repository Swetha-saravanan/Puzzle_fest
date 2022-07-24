class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles ,:answer , :string
  end
end
