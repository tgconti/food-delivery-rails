class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item
      t.boolean :delivered
      t.decimal :price, precision: 5, scale: 2
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
