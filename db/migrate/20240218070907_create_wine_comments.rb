class CreateWineComments < ActiveRecord::Migration[6.1]
  def change
    create_table :wine_comments do |t|
      t.text :comment, null: false
      t.references :wine, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
