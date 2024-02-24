class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :wine

  def total_per_wine
    wine.price * amount
  end
end