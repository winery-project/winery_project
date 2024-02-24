class FavoriteWine < ApplicationRecord
  belongs_to :customer
  belongs_to :wine

  validates :customer_id, presence: true
  validates :wine_id, presence: true
end
