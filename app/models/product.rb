class Product < ApplicationRecord
  mount_uploaders :product_image, ProductImageUploader
  serialize :product_image, JSON
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_image, presence: true
  belongs_to :product_category
  has_many :messages, dependent: :destroy
end
