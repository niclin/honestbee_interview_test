class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  def discount_price
    (price * 0.8).round(2)
  end
end
