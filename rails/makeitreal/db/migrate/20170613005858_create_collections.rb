class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :season
      t.date :end_date

      t.timestamps
    end
  end
end
