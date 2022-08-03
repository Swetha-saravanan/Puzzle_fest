class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.string :name
      t.references :users, index: true, foreign_key: true
      t.timestamps
    end
  end
end
