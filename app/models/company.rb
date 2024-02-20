class Company < ApplicationRecord
  has_one_attached :logo_image

  belongs_to :country
  has_many :favorite_companies, dependent: :destroy

  def get_logo_image(width, height)
    unless logo_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      logo_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpg')
    end
    logo_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    if favorite_companies.exists?(customer_id: customer.id)
      return true
    else
      return false
    end
  end
end
