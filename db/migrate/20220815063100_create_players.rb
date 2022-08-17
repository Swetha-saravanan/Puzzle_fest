class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.references :users
      t.references :assessments
      t.timestamps
    end
  end
end
