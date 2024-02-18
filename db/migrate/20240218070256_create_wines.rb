class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :maturity, null: false
      t.integer :fruity, null: false
      t.integer :flavor, null: false
      t.integer :bitter, null: false
      t.integer :smooth, null: false
      t.integer :aftertaste, null: false
      t.integer :price, null: false
      t.boolean :is_sold, default: true, null: false
      t.references :genre, foreign_key: true
      t.references :company, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
