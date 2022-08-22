class AddColumntogamers < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :users, index: true
  end
end
