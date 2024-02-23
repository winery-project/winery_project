class Wine < ApplicationRecord
  belongs_to :country
  belongs_to :genre
  belongs_to :company

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
end
