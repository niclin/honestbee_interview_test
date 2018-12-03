class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :price, presence: true

  def discount_price
    (price * 0.8).round(2)
  end
end
