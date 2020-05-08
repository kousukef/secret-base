class Product < ApplicationRecord
  mount_uploader :product_image, ProductImageUploader
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_image, presence: true
  belongs_to :product_category
  has_many :messages, dependent: :destroy
end
