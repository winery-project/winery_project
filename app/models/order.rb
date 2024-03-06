class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    credit_card: 0,
    cash: 1
  }

  enum status: {
    waiting_payment: 0,
    placing_order: 1,
    preparing: 2,
    shipping: 3,
    completed: 4
  }

  def integrated_address
    delivery_name + "　" + "〒" + delivery_postal_code + "　" + delivery_address
  end
end
