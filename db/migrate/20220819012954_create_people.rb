class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
