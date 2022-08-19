class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.references :person, null: false, foreign_key: true
      t.string :employer
      t.date :date_started
      t.date :date_ended

      t.timestamps
    end
  end
end
