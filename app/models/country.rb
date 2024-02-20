class Country < ApplicationRecord
  has_one_attached :flag_image

  has_many :countries, dependent: :destroy

  def get_flag_image(width, height)
    unless flag_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      flag_image.attach(io: File.open(file_path), filename: 'default_image.jpeg', content_type: 'image/jpg')
    end
    flag_image.variant(resize_to_limit: [width, height]).processed
  end

end