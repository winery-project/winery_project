class Delivery < ApplicationRecord
  belongs_to :customer

  def integrated_address
    name + "　" + "〒" + postal_code + "　" + address
  end
end
