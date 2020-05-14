class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :purchaser, class_name: 'User', optional: true
  belongs_to :product_category
  has_many :q_and_a_messages, dependent: :destroy
  has_many :after_purchased_messages, dependent: :destroy
  has_many_attached :images
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_image, presence: true
end
