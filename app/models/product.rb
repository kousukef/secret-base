class Product < ApplicationRecord
  mount_uploaders :product_image, ProductImageUploader
  serialize :product_image, JSON
  belongs_to :seller, class_name: 'User'
  belongs_to :puchaser, class_name: 'User'
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_image, presence: true
  belongs_to :product_category
  has_many :q_and_a_messages, dependent: :destroy
  has_many :after_purchased_messages, dependent: :destroy
end
