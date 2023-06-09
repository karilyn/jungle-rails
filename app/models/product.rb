class Product < ApplicationRecord
  monetize :price_cents, numericality: true, allow_nil: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def is_sold_out?
    quantity == 0
  end
end
