class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :delivery_name, null: false
      t.string :delivery_address, null: false
      t.string :delivery_postal_code, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :shipping_cost, null: false
      t.integer :status, null: false, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
