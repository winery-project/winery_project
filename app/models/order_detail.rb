class OrderDetail < ApplicationRecord
  belongs_to :wine
  belongs_to :order
end
