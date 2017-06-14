class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :line1, limit: 50, null: false
      t.string :line2, limit: 50
      t.string :zip, limit: 10, null: false
      t.string :country, limit: 2, null: false
      t.string :city, limit: 50, null: false

      t.timestamps
    end
  end
end
