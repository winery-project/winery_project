class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, uniqueness: { scope: :is_active, if: -> { is_active == true } }

  has_many :favorite_companies, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  enum is_active: {
    active: true,
    withdrawn: false
  }
end