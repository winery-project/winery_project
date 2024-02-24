class Genre < ApplicationRecord
  has_many :wines, dependent: :destroy
  validates :name, presence: true
end
