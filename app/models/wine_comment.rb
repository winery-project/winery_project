class WineComment < ApplicationRecord
  belongs_to :wine
  belongs_to :customer

  validates :comment, presence: true
end
