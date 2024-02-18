class CreateFavoriteWines < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_wines do |t|
      t.references :wine, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
