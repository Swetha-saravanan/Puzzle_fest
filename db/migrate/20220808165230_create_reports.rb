class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :user_answer
      t.references :users , index: true
      t.references :assessments , index: true
      t.integer :score
      t.time :time_limit

      t.timestamps
    end
  end
end
