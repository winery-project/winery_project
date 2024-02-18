class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :amount, null: false
      t.integer :taxed_price, null: false
      t.integer :status, null: false, default: 0
      t.references :wine, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
