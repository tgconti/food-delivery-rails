class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 5, scale: 2
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
