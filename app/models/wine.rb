class Wine < ApplicationRecord
  belongs_to :country
  belongs_to :genre
  belongs_to :company

  has_many :wine_comments, dependent: :destroy

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  has_many :favorite_wines, dependent: :destroy

  has_one_attached :wine_image


  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :country_id, presence: true
  validates :company_id, presence: true
  validates :genre_id, presence: true
  validates :flavor, presence: true
  validates :aftertaste, presence: true
  validates :bitter, presence: true
  validates :smooth, presence: true
  validates :maturity, presence: true
  validates :fruity, presence: true



  def get_wine_image(width, height)
    unless wine_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      wine_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    wine_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    favorite_wines.exists?(customer_id: customer.id)
  end

end
