class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :numberOfItems
      t.decimal :totalPrice
      t.string :shippingLocation
      t.boolean :orderConfirmed, default: false
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
